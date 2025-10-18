# Backend Sync Feature - Implementation Tasks

## Status Legend

- ⬜ Not Started
- 🔄 In Progress
- ✅ Completed
- ⏸️ Blocked

---

## Phase 1: Foundation (DTOs & Settings)

### Task 1.1: Add UUID Identifiers to Models

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: S (30 min)

**Description**:
Add explicit UUID identifiers to Product and Purchase models if not already present. SwiftData may auto-generate IDs, but we need explicit UUIDs for backend sync.

**Acceptance Criteria**:

- [ ] Product model has `id: UUID` property
- [ ] Purchase model has `id: UUID` property
- [ ] UUIDs are automatically generated on entity creation
- [ ] Existing data migration handled (if needed)

**Files to Modify**:

- `Models/Product.swift`
- `Models/Purchase.swift`

**Dependencies**: None

---

### Task 1.2: Add Sync Metadata to Models

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: S (30 min)

**Description**:
Add `lastSynced` timestamp to track when each entity was last synchronized with backend.

**Acceptance Criteria**:

- [ ] Product has `lastSynced: Date?` property
- [ ] Purchase has `lastSynced: Date?` property
- [ ] Property is optional (nil for never synced)

**Files to Modify**:

- `Models/Product.swift`
- `Models/Purchase.swift`

**Dependencies**: None

---

### Task 1.3: Create ProductDTO

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (1 hour)

**Description**:
Create a Codable DTO struct for Product that can be serialized to/from JSON for backend API communication.

**Acceptance Criteria**:

- [ ] ProductDTO struct created with all Product properties
- [ ] Implements Codable protocol
- [ ] Has `init(from product: Product)` conversion method
- [ ] Has `toProduct() -> Product` conversion method
- [ ] Handles all date formatting for API
- [ ] Preserves all Austrian locale data

**Files to Create**:

- `DTOs/ProductDTO.swift`

**Dependencies**: Task 1.1, Task 1.2

---

### Task 1.4: Create PurchaseDTO

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (1 hour)

**Description**:
Create a Codable DTO struct for Purchase that can be serialized to/from JSON for backend API communication.

**Acceptance Criteria**:

- [ ] PurchaseDTO struct created with all Purchase properties
- [ ] Implements Codable protocol
- [ ] Has `productId: UUID` to reference Product
- [ ] Has `init(from purchase: Purchase)` conversion method
- [ ] Has `toPurchase(product: Product) -> Purchase` conversion method
- [ ] Handles date formatting for API

**Files to Create**:

- `DTOs/PurchaseDTO.swift`

**Dependencies**: Task 1.1, Task 1.2

---

### Task 1.5: Create Keychain Helper

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (1.5 hours)

**Description**:
Create a utility class to securely store the backend API token in iOS/macOS Keychain.

**Acceptance Criteria**:

- [ ] KeychainHelper class created
- [ ] Method to save token: `save(token: String, for key: String) -> Bool`
- [ ] Method to load token: `load(for key: String) -> String?`
- [ ] Method to delete token: `delete(for key: String) -> Bool`
- [ ] Works on both iOS and macOS
- [ ] Handles Keychain errors gracefully

**Files to Create**:

- `Helpers/KeychainHelper.swift`

**Dependencies**: None

---

### Task 1.6: Create BackendSyncSettings

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (1.5 hours)

**Description**:
Create an @Observable settings class to manage backend sync configuration, similar to FamilySharingSettings.

**Acceptance Criteria**:

- [ ] BackendSyncSettings class created as @Observable
- [ ] Singleton instance pattern (shared)
- [ ] Property: `isBackendSyncEnabled: Bool` (UserDefaults)
- [ ] Property: `backendURL: String` (UserDefaults)
- [ ] Property: `lastSyncDate: Date?` (UserDefaults)
- [ ] Property: `autoSyncEnabled: Bool` (UserDefaults, default true)
- [ ] Property: `syncStatus: SyncStatus` (in-memory)
- [ ] Property: `apiToken: String` (Keychain via KeychainHelper)
- [ ] SyncStatus enum with cases: idle, syncing, synced(Date), error(String)
- [ ] Method: `validateConfiguration() -> Bool`
- [ ] Method: `saveSettings()`

**Files to Create**:

- `Settings/BackendSyncSettings.swift`

**Dependencies**: Task 1.5

---

## Phase 2: Backend API Client

### Task 2.1: Create API Error Types

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: S (30 min)

**Description**:
Define error types for backend API communication.

**Acceptance Criteria**:

- [ ] APIError enum created
- [ ] Cases for: networkError, httpError(statusCode), authenticationError, decodingError, invalidURL
- [ ] LocalizedError conformance for user-friendly messages
- [ ] German error messages

**Files to Create**:

- `Services/BackendAPIClient.swift` (error types section)

**Dependencies**: None

---

### Task 2.2: Create BackendAPIClient

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: L (3 hours)

**Description**:
Create HTTP client for backend REST API communication.

**Acceptance Criteria**:

- [ ] BackendAPIClient class created
- [ ] Uses URLSession for HTTP requests
- [ ] Includes API token in Authorization header
- [ ] Enforces HTTPS only
- [ ] Method: `fetchProducts() async throws -> [ProductDTO]`
- [ ] Method: `createProduct(_ product: ProductDTO) async throws -> ProductDTO`
- [ ] Method: `updateProduct(_ product: ProductDTO) async throws -> ProductDTO`
- [ ] Method: `deleteProduct(id: UUID) async throws`
- [ ] Method: `fetchPurchases() async throws -> [PurchaseDTO]`
- [ ] Method: `createPurchase(_ purchase: PurchaseDTO) async throws -> PurchaseDTO`
- [ ] Method: `updatePurchase(_ purchase: PurchaseDTO) async throws -> PurchaseDTO`
- [ ] Method: `deletePurchase(id: UUID) async throws`
- [ ] Method: `testConnection() async throws -> Bool`
- [ ] Proper error handling and mapping to APIError
- [ ] JSON encoding/decoding with date formatting

**Files to Create/Modify**:

- `Services/BackendAPIClient.swift`

**Dependencies**: Task 1.3, Task 1.4, Task 2.1

---

## Phase 3: Sync Service

### Task 3.1: Create BackendSyncService Foundation

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (2 hours)

**Description**:
Create the sync service class with basic structure and state management.

**Acceptance Criteria**:

- [ ] BackendSyncService class created as @Observable
- [ ] Singleton instance pattern
- [ ] Reference to BackendAPIClient
- [ ] Reference to BackendSyncSettings
- [ ] Reference to ModelContext (injected)
- [ ] Property: `isSyncing: Bool`
- [ ] Property: `syncError: Error?`
- [ ] Method: `configure(modelContext: ModelContext)`
- [ ] Thread-safe state management

**Files to Create**:

- `Services/BackendSyncService.swift`

**Dependencies**: Task 1.6, Task 2.2

---

### Task 3.2: Implement Full Sync

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: L (4 hours)

**Description**:
Implement initial full synchronization of all data.

**Acceptance Criteria**:

- [ ] Method: `performFullSync() async throws`
- [ ] Fetch all local Products and Purchases
- [ ] Convert to DTOs
- [ ] Upload all to backend
- [ ] Fetch all remote Products and Purchases
- [ ] Merge remote data with local (conflict resolution)
- [ ] Update lastSynced timestamps
- [ ] Handle errors gracefully
- [ ] Update sync status in BackendSyncSettings

**Files to Modify**:

- `Services/BackendSyncService.swift`

**Dependencies**: Task 3.1

---

### Task 3.3: Implement Incremental Sync

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: L (3 hours)

**Description**:
Implement incremental sync for changed entities only.

**Acceptance Criteria**:

- [ ] Method: `syncChanges() async throws`
- [ ] Detect locally changed entities (where lastUpdated > lastSynced)
- [ ] Upload changes to backend
- [ ] Fetch remote changes since last sync
- [ ] Apply remote changes with conflict resolution
- [ ] Update lastSynced timestamps
- [ ] More efficient than full sync

**Files to Modify**:

- `Services/BackendSyncService.swift`

**Dependencies**: Task 3.2

---

### Task 3.4: Implement Conflict Resolution

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (2 hours)

**Description**:
Implement logic to resolve conflicts between local and remote data.

**Acceptance Criteria**:

- [ ] Method: `resolveConflict(local: DTO, remote: DTO) -> DTO`
- [ ] Use lastUpdated timestamp to determine winner
- [ ] Remote wins if remote.lastUpdated > local.lastUpdated
- [ ] Local wins otherwise
- [ ] Log conflicts for debugging
- [ ] Preserve data integrity

**Files to Modify**:

- `Services/BackendSyncService.swift`

**Dependencies**: Task 3.1

---

### Task 3.5: Implement Retry Logic

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: M (2 hours)

**Description**:
Add exponential backoff retry for transient failures.

**Acceptance Criteria**:

- [ ] Retry transient errors (network timeout, 5xx)
- [ ] Exponential backoff: 1s, 2s, 4s, 8s, 16s
- [ ] Max 5 retry attempts
- [ ] Do not retry 4xx or auth errors
- [ ] Log retry attempts

**Files to Modify**:

- `Services/BackendSyncService.swift`

**Dependencies**: Task 3.1

---

## Phase 4: UI Integration

### Task 4.1: Add Backend Settings UI Section

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: L (2.5 hours)

**Description**:
Add backend sync settings section to SettingsView.

**Acceptance Criteria**:

- [ ] New "Backend-Synchronisation" section in SettingsView
- [ ] Toggle: Enable/Disable backend sync
- [ ] TextField: Backend URL input
- [ ] SecureField: API token input (with show/hide)
- [ ] Button: "Verbindung testen" (Test Connection)
- [ ] Button: "Jetzt synchronisieren" (Sync Now)
- [ ] Toggle: Enable/Disable automatic sync
- [ ] Text: Last sync timestamp display
- [ ] Text: Current sync status display
- [ ] Proper validation (URL format, token not empty)
- [ ] German localization
- [ ] Works on iOS and macOS

**Files to Modify**:

- `Settings/SettingsView.swift`

**Dependencies**: Task 1.6, Task 3.1

---

### Task 4.2: Add Sync Status Indicators

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: M (1.5 hours)

**Description**:
Add visual indicators for sync status in the UI.

**Acceptance Criteria**:

- [ ] Sync status icon in toolbar (optional)
- [ ] Show activity indicator when syncing
- [ ] Show checkmark when synced
- [ ] Show error icon when sync fails
- [ ] Tooltip/description of current status

**Files to Modify**:

- `Views/ContentView.swift`

**Dependencies**: Task 1.6, Task 3.1

---

### Task 4.3: Add Error Alerts

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (1 hour)

**Description**:
Display user-friendly error alerts when sync fails.

**Acceptance Criteria**:

- [ ] Alert shown when sync error occurs
- [ ] Error message in German
- [ ] Options: "Wiederholen" (Retry), "Abbrechen" (Cancel)
- [ ] Clear error state after user interaction

**Files to Modify**:

- `Settings/SettingsView.swift`

**Dependencies**: Task 4.1

---

## Phase 5: Automatic Sync & Triggers

### Task 5.1: Add Sync Trigger on Data Changes

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: M (2 hours)

**Description**:
Automatically trigger sync when local data changes.

**Acceptance Criteria**:

- [ ] Observe SwiftData context changes
- [ ] Trigger sync when Product is created/updated/deleted
- [ ] Trigger sync when Purchase is created/updated/deleted
- [ ] Debounce sync (wait 5 seconds after last change)
- [ ] Only trigger if backend sync and auto-sync enabled
- [ ] Don't sync during manual sync

**Files to Modify**:

- `ViewModels/ProductViewModel.swift`
- `ViewModels/PurchaseViewModel.swift`
- Or create a ModelObserver service

**Dependencies**: Task 3.3

---

### Task 5.2: Add Network Connectivity Monitoring

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: M (1.5 hours)

**Description**:
Monitor network connectivity and trigger sync when coming online.

**Acceptance Criteria**:

- [ ] Use NWPathMonitor to detect network changes
- [ ] Trigger sync when network becomes available
- [ ] Queue changes made while offline
- [ ] Sync queued changes when online

**Files to Create/Modify**:

- `Services/NetworkMonitor.swift`
- `Services/BackendSyncService.swift`

**Dependencies**: Task 3.3

---

### Task 5.3: Implement Offline Queue

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: L (3 hours)

**Description**:
Queue changes made while offline for later sync.

**Acceptance Criteria**:

- [ ] Persist queued changes to disk
- [ ] Track operation type (create, update, delete)
- [ ] Process queue when network available
- [ ] Handle queue processing errors
- [ ] Clear processed items from queue

**Files to Modify**:

- `Services/BackendSyncService.swift`

**Dependencies**: Task 5.2

---

## Phase 6: Testing & Refinement

### Task 6.1: Unit Tests for DTOs

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (1.5 hours)

**Description**:
Write unit tests for DTO conversion logic.

**Acceptance Criteria**:

- [ ] Test Product → ProductDTO conversion
- [ ] Test ProductDTO → Product conversion
- [ ] Test Purchase → PurchaseDTO conversion
- [ ] Test PurchaseDTO → Purchase conversion
- [ ] Test round-trip conversions
- [ ] Test edge cases (empty strings, zero values)

**Files to Create**:

- `Alles-TeurerTests/DTOTests.swift`

**Dependencies**: Task 1.3, Task 1.4

---

### Task 6.2: Unit Tests for API Client

**Status**: ⬜ Not Started  
**Priority**: High  
**Estimated Effort**: M (2 hours)

**Description**:
Write unit tests for BackendAPIClient using mock server.

**Acceptance Criteria**:

- [ ] Test successful API calls
- [ ] Test error responses (4xx, 5xx)
- [ ] Test network errors
- [ ] Test authentication failures
- [ ] Test JSON encoding/decoding
- [ ] Use URLProtocol mocking

**Files to Create**:

- `Alles-TeurerTests/BackendAPIClientTests.swift`

**Dependencies**: Task 2.2

---

### Task 6.3: Integration Tests for Sync

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: L (3 hours)

**Description**:
Write integration tests for sync workflows.

**Acceptance Criteria**:

- [ ] Test full sync workflow
- [ ] Test incremental sync workflow
- [ ] Test conflict resolution
- [ ] Test offline queue
- [ ] Use in-memory SwiftData container
- [ ] Use mock backend

**Files to Create**:

- `Alles-TeurerTests/BackendSyncServiceTests.swift`

**Dependencies**: Task 3.2, Task 3.3, Task 3.4

---

### Task 6.4: Localization Review

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: S (1 hour)

**Description**:
Ensure all user-facing strings are localized in German (de_AT).

**Acceptance Criteria**:

- [ ] All error messages in German
- [ ] All UI labels in German
- [ ] Settings descriptions in German
- [ ] Add strings to Localizable.xcstrings

**Files to Modify**:

- `Localizable.xcstrings`

**Dependencies**: Task 4.1, Task 4.2, Task 4.3

---

### Task 6.5: Documentation

**Status**: ⬜ Not Started  
**Priority**: Medium  
**Estimated Effort**: M (1.5 hours)

**Description**:
Create user and developer documentation for backend sync feature.

**Acceptance Criteria**:

- [ ] Update README with backend sync instructions
- [ ] Document backend API requirements
- [ ] Document how to obtain API token
- [ ] Add code comments to all new classes
- [ ] Create architecture diagram

**Files to Create/Modify**:

- `README.md`
- `BACKEND_SYNC.md`

**Dependencies**: All previous tasks

---

## Summary

**Total Estimated Effort**: ~35 hours

**Phases**:

1. Foundation: ~5.5 hours
2. Backend API Client: ~3.5 hours
3. Sync Service: ~13 hours
4. UI Integration: ~5 hours
5. Automatic Sync: ~6.5 hours
6. Testing & Refinement: ~8.5 hours

**Critical Path**: Tasks 1.1 → 1.2 → 1.3/1.4 → 2.2 → 3.1 → 3.2 → 3.3 → 4.1

**Recommended Approach**: Implement in phases, testing each phase before moving to next.
