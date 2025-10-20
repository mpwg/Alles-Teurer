# Backend Sync Feature - Technical Design

## Architecture Overview

The backend sync feature will be implemented as an optional, independent service layer that sits between the SwiftData layer and a remote REST API backend. The architecture follows these principles:

1. **Separation of Concerns**: Sync logic is isolated from UI and data models
2. **Non-Invasive**: Existing models and views require minimal changes
3. **Fault Tolerant**: Failures in sync do not affect local app functionality
4. **Platform Agnostic**: Works on both iOS and macOS

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     UI Layer                            │
│  (SwiftUI Views: ContentView, SettingsView, etc.)      │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                 ViewModels                              │
│     (ProductViewModel, PurchaseViewModel, etc.)         │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│              SwiftData Layer                            │
│         (Product @Model, Purchase @Model)               │
└─────────┬──────────────────────────────────┬────────────┘
          │                                  │
          │                                  │
┌─────────▼──────────┐            ┌──────────▼────────────┐
│  Local Storage     │            │   BackendSyncService  │
│  (SQLite)          │            │   (NEW)               │
└────────────────────┘            └──────────┬────────────┘
                                             │
                                  ┌──────────▼────────────┐
                                  │  BackendAPIClient     │
                                  │  (NEW)                │
                                  └──────────┬────────────┘
                                             │
                                  ┌──────────▼────────────┐
                                  │  Remote Backend       │
                                  │  (REST API)           │
                                  └───────────────────────┘
```

## Component Design

### 1. Data Transfer Objects (DTOs)

**Purpose**: Codable representations of SwiftData models for JSON serialization

**Files to Create**:

- `DTOs/ProductDTO.swift`
- `DTOs/PurchaseDTO.swift`

**ProductDTO**:

```swift
struct ProductDTO: Codable, Identifiable {
    let id: UUID
    var normalizedName: String
    var bestPricePerQuantity: Double
    var bestPriceStore: String
    var highestPricePerQuantity: Double
    var highestPriceStore: String
    var unit: String
    var lastUpdated: Date
    var lastSynced: Date?

    // Conversion methods
    init(from product: Product)
    func toProduct() -> Product
}
```

**PurchaseDTO**:

```swift
struct PurchaseDTO: Codable, Identifiable {
    let id: UUID
    var shopName: String
    var date: Date
    var totalPrice: Double
    var quantity: Double
    var actualProductName: String
    var unit: String
    var productId: UUID
    var lastSynced: Date?

    // Conversion methods
    init(from purchase: Purchase)
    func toPurchase(product: Product) -> Purchase
}
```

### 2. Backend API Client

**Purpose**: HTTP client for communication with backend REST API

**File to Create**: `Services/BackendAPIClient.swift`

**Responsibilities**:

- Make HTTP requests (GET, POST, PUT, DELETE)
- Handle authentication via API token
- Parse JSON responses
- Handle network errors
- Provide typed API endpoints

**API Endpoints**:

```
GET    /api/products         - Fetch all products
POST   /api/products         - Create new product
PUT    /api/products/:id     - Update product
DELETE /api/products/:id     - Delete product

GET    /api/purchases        - Fetch all purchases
POST   /api/purchases        - Create new purchase
PUT    /api/purchases/:id    - Update purchase
DELETE /api/purchases/:id    - Delete purchase

GET    /api/sync/status      - Get last sync timestamp
POST   /api/sync/full        - Perform full sync (batch upload/download)
```

**Error Handling**:

- Network errors (no connectivity)
- HTTP status codes (4xx, 5xx)
- JSON parsing errors
- Authentication errors (401, 403)

### 3. Backend Sync Service

**Purpose**: Orchestrate synchronization between local SwiftData and remote backend

**File to Create**: `Services/BackendSyncService.swift`

**Responsibilities**:

- Manage sync state (idle, syncing, error)
- Track pending changes
- Execute full sync (initial)
- Execute incremental sync (changes only)
- Handle conflict resolution
- Manage sync queue for offline changes
- Retry failed sync operations

**Sync Strategies**:

**Full Sync** (first-time or on demand):

1. Fetch all products and purchases from backend
2. Compare with local data by UUID
3. Apply remote changes where remote.lastUpdated > local.lastUpdated
4. Upload new local items not present on backend
5. Update lastSynced timestamp

**Incremental Sync** (after changes):

1. Detect local changes (new, updated, deleted)
2. Upload changes to backend
3. Fetch recent remote changes (since lastSynced)
4. Apply remote changes with conflict resolution
5. Update lastSynced timestamp

**Conflict Resolution**:

- Use `lastUpdated` timestamp to determine winner
- Remote wins if remote.lastUpdated > local.lastUpdated
- Local wins otherwise
- Log conflicts for user review (future enhancement)

### 4. Backend Settings Manager

**Purpose**: Store and manage backend sync configuration

**File to Create**: `Settings/BackendSyncSettings.swift`

**Storage**:

- UserDefaults for non-sensitive settings
- Keychain for API token

**Properties**:

```swift
@Observable
class BackendSyncSettings {
    static let shared = BackendSyncSettings()

    var isBackendSyncEnabled: Bool        // UserDefaults
    var backendURL: String                // UserDefaults
    var lastSyncDate: Date?               // UserDefaults
    var syncStatus: SyncStatus            // In-memory
    var apiToken: String                  // Keychain (secure)
    var autoSyncEnabled: Bool             // UserDefaults

    enum SyncStatus {
        case idle
        case syncing
        case synced(Date)
        case error(String)
    }
}
```

### 5. Model Extensions

**Purpose**: Add sync-related functionality to existing models

**Modifications**:

- `Product.swift`: Add `id: UUID` (if not present), `lastSynced: Date?`
- `Purchase.swift`: Add `id: UUID` (if not present), `lastSynced: Date?`

**Note**: SwiftData models likely already have persistent IDs. We'll leverage these or add explicit UUIDs.

### 6. UI Integration

**File to Modify**: `Settings/SettingsView.swift`

**New UI Elements**:

1. **Backend Sync Section**:

   - Toggle: Enable/Disable backend sync
   - Text field: Backend URL
   - Secure field: API token
   - Button: "Test Connection"
   - Button: "Sync Now" (manual trigger)
   - Label: Last sync status/timestamp
   - Toggle: Enable automatic sync

2. **Sync Status Indicator**:
   - Show sync activity in main view (optional)
   - Display errors if sync fails

## Data Flow Diagrams

### Scenario 1: User Creates New Purchase

```
User → AddPurchaseSheet → SwiftData.insert(purchase)
                              ↓
                         ModelContext.save()
                              ↓
                    (if BackendSync enabled)
                              ↓
                      BackendSyncService.syncPurchase()
                              ↓
                      BackendAPIClient.createPurchase()
                              ↓
                         Remote Backend
```

### Scenario 2: Initial Full Sync

```
User enables backend sync → BackendSyncService.performFullSync()
                                     ↓
                            1. Upload all local Products
                                     ↓
                            2. Upload all local Purchases
                                     ↓
                            3. Fetch all remote Products
                                     ↓
                            4. Fetch all remote Purchases
                                     ↓
                            5. Merge with conflict resolution
                                     ↓
                            6. Update lastSynced timestamps
```

### Scenario 3: Offline Queue

```
User makes changes (offline) → Queue change in memory/disk
                                     ↓
                            Network becomes available
                                     ↓
                          BackendSyncService detects online
                                     ↓
                            Process queued changes
                                     ↓
                            Upload to backend
```

## Implementation Considerations

### SwiftData Integration

**Challenge**: SwiftData models cannot be easily serialized to JSON directly

**Solution**: Create DTO layer for serialization

- DTOs are plain Codable structs
- Extension methods convert between Model ↔ DTO
- Sync service works with DTOs, not Models directly

### Unique Identifiers

**Challenge**: Need consistent IDs across local and remote

**Solution**: Use UUID as primary identifier

- Add `id: UUID` property to Product and Purchase
- Use UUID for all sync operations
- Backend uses same UUID for entity identification

### Change Tracking

**Challenge**: Detect what changed since last sync

**Solution**:

- Option 1: Track `lastSynced` timestamp per entity
- Option 2: Maintain a change log/queue
- Recommended: Option 1 (simpler, less overhead)

### Relationship Preservation

**Challenge**: Purchases reference Products (foreign key relationship)

**Solution**:

- Always sync Products before Purchases
- Use Product UUID in Purchase DTO
- Verify Product exists before creating Purchase locally
- Handle orphaned Purchases (Product deleted remotely)

### Error Recovery

**Transient Errors** (network timeout, 5xx):

- Retry with exponential backoff (1s, 2s, 4s, 8s, 16s max)
- Max 5 retry attempts
- Queue changes for later if all retries fail

**Permanent Errors** (4xx, auth failure):

- Do not retry automatically
- Notify user
- Disable automatic sync
- Allow manual retry after user fixes configuration

### Performance Optimization

**Batch Operations**:

- Upload/download multiple entities in single request
- Use pagination for large datasets
- Limit initial sync to recent data (optional)

**Background Sync**:

- Use Background Tasks framework for iOS
- Sync during app idle time
- Don't block UI thread

### Security

**Token Storage**:

```swift
// Use Keychain for secure storage
import Security

class KeychainHelper {
    static func save(token: String, for key: String) -> Bool
    static func load(for key: String) -> String?
    static func delete(for key: String) -> Bool
}
```

**HTTPS Enforcement**:

- Reject HTTP connections (non-TLS)
- Validate SSL certificates
- Use App Transport Security settings

### Testing Strategy

**Unit Tests**:

- DTO conversion (Model ↔ DTO)
- API client request building
- Error handling logic
- Conflict resolution algorithm

**Integration Tests**:

- Full sync flow
- Incremental sync flow
- Offline queue processing
- Network error scenarios

**Manual Testing**:

- Test with real backend
- Test offline/online transitions
- Test conflict scenarios
- Test UI feedback

## Migration Strategy

### Phase 1: Foundation

1. Create DTO structs
2. Add UUID identifiers to models (if needed)
3. Create BackendAPIClient skeleton
4. Create BackendSyncSettings

### Phase 2: Core Sync

1. Implement BackendSyncService
2. Implement full sync
3. Implement incremental sync
4. Add change tracking

### Phase 3: UI Integration

1. Add backend settings UI
2. Add sync status indicators
3. Add manual sync button
4. Add error notifications

### Phase 4: Refinement

1. Implement automatic sync
2. Add offline queue
3. Implement retry logic
4. Performance optimization

### Phase 5: Testing & Polish

1. Unit tests
2. Integration tests
3. Error message localization (German)
4. Documentation

## Risk Mitigation

| Risk                           | Impact   | Mitigation                             |
| ------------------------------ | -------- | -------------------------------------- |
| Backend unavailable            | High     | Offline queue, graceful degradation    |
| Data corruption during sync    | Critical | Atomic operations, rollback on failure |
| SwiftData serialization issues | Medium   | Comprehensive DTO testing              |
| Relationship integrity broken  | High     | Validate references before applying    |
| Performance impact on UI       | Medium   | Background threading, async operations |
| Security token exposure        | Critical | Keychain storage, HTTPS only           |

## Open Questions

1. **Backend Implementation**: Who will implement the backend server?
2. **API Specification**: Is there an existing API spec or should we define one?
3. **Authentication Flow**: How do users obtain API tokens?
4. **Multi-Device Sync**: Should sync work across user's multiple devices?
5. **Data Privacy**: Any GDPR or data residency requirements?

## Next Steps

1. Review and approve this design
2. Answer open questions
3. Create detailed implementation tasks
4. Set up backend API (or mock API for development)
5. Begin Phase 1 implementation
