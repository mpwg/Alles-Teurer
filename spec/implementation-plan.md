# AllesTeurer - Native iOS Implementation Plan

## Executive Summary

This document provides a comprehensive implementation plan for AllesTeurer, a privacy-focused native iOS application that enables users to track product prices through receipt scanning and local price monitoring. The app uses SwiftUI for the user interface, SwiftData for local data persistence, Apple's Vision Framework for OCR text recognition, and Swift Charts for data visualization, ensuring maximum performance while maintaining complete user privacy.

## 1. Project Architecture Overview

### 1.1 Native iOS Technology Stack

**Core Technologies:**

- **Language:** Swift 5.9+ with modern async/await patterns
- **UI Framework:** SwiftUI with Observation framework
- **Architecture:** MVVM with Repository pattern
- **Database:** SwiftData for native iOS data persistence
- **Concurrency:** Swift Concurrency (async/await, actors)
- **Charts:** Swift Charts for native data visualization

**iOS System Integrations:**

**Core Services:**

- **OCR:** Vision Framework for German text recognition
- **Camera:** AVFoundation for receipt capture
- **Local Storage:** SwiftData for type-safe data persistence
- **Sync:** Optional CloudKit for device synchronization
- **Analytics:** Local Swift algorithms for price analysis

### 1.2 iOS Project Structure

```text
Alles Teurer/
├── Alles Teurer/              # Main iOS App
│   ├── Alles_TeurerApp.swift       # App Entry Point with SwiftData ModelContainer
│   ├── ContentView.swift           # Main SwiftUI View with TabView
│   ├── Models/                     # SwiftData Models
│   │   ├── Receipt.swift           # Receipt entity with @Model
│   │   ├── Product.swift           # Product entity with @Model
│   │   ├── PriceHistory.swift      # Price tracking entity
│   │   └── Category.swift          # Product categories
│   ├── ViewModels/                 # Observable ViewModels
│   │   ├── ScannerViewModel.swift  # Receipt scanning logic
│   │   ├── ProductsViewModel.swift # Product management
│   │   ├── AnalyticsViewModel.swift # Price analytics
│   │   └── SettingsViewModel.swift # App settings
│   ├── Views/                      # SwiftUI Views
│   │   ├── Scanner/                # Receipt scanning interface
│   │   │   ├── ScannerView.swift
│   │   │   ├── CameraView.swift
│   │   │   └── ResultsView.swift
│   │   ├── Products/               # Product list and details
│   │   │   ├── ProductListView.swift
│   │   │   ├── ProductDetailView.swift
│   │   │   └── ProductEditView.swift
│   │   ├── Analytics/              # Price charts and insights
│   │   │   ├── AnalyticsView.swift
│   │   │   ├── ChartViews.swift
│   │   │   └── TrendView.swift
│   │   └── Settings/               # App configuration
│   │       ├── SettingsView.swift
│   │       ├── ExportView.swift
│   │       └── CloudKitView.swift
│   ├── Services/                   # Business Logic
│   │   ├── OCRService.swift        # Vision Framework integration
│   │   ├── DataManager.swift       # SwiftData operations
│   │   ├── PriceAnalyzer.swift     # Local analytics calculations
│   │   ├── CloudKitService.swift   # Optional CloudKit sync
│   │   └── ExportService.swift     # Data export functionality
│   ├── Extensions/                 # Swift Extensions
│   │   ├── View+Extensions.swift
│   │   ├── Date+Extensions.swift
│   │   └── String+Extensions.swift
│   └── Resources/                  # Assets and Configuration
│       ├── Assets.xcassets/        # App icons and images
│       ├── Info.plist              # App configuration
│       └── Alles_Teurer.entitlements # App capabilities
├── Alles Teurer.xcodeproj/        # Xcode Project Configuration
├── Alles TeurerTests/             # Unit Tests using Swift Testing
├── Alles TeurerUITests/           # UI Tests using XCUITest
└── fastlane/                      # App Store deployment automation
```

## 2. Implementation Phases

### Phase 1: iOS Foundation & Core Features (Weeks 1-4)

#### 2.1 iOS Project Setup & SwiftData Foundation

**Timeline:** Week 1  
**Effort:** 5 days  
**Dependencies:** None

**Deliverables:**

- [ ] Xcode project configuration with proper bundle identifier
- [ ] SwiftData ModelContainer setup with proper schema
- [ ] Core SwiftData models (Receipt, Product, PriceRecord)
- [ ] Basic SwiftUI app structure with TabView
- [ ] iOS deployment configuration (iOS 17.0+ target)

**Implementation Tasks:**

1. **Initialize Xcode Project**

   ```bash
   # Create new iOS App project in Xcode 15.0+
   # Configure bundle identifier: eu.mpwg.allesteurer
   # Set deployment target: iOS 17.0
   # Enable SwiftData capability
   ```

2. **Setup SwiftData Foundation**

   ```swift
   // Alles_TeurerApp.swift - Main app entry point
   import SwiftUI
   import SwiftData

   @main
   struct Alles_TeurerApp: App {
       var sharedModelContainer: ModelContainer = {
           let schema = Schema([
               Receipt.self,
               Product.self,
               PriceRecord.self
           ])
           let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

           do {
               return try ModelContainer(for: schema, configurations: [modelConfiguration])
           } catch {
               fatalError("Could not create ModelContainer: \(error)")
           }
       }()

       var body: some Scene {
           WindowGroup {
               ContentView()
           }
           .modelContainer(sharedModelContainer)
       }
   }
   ```

3. **Core SwiftData Models**

   ```swift
   import SwiftData
   import Foundation

   @Model
   final class Receipt {
       let id: UUID
       let storeName: String
       let scanDate: Date
       let totalAmount: Double
       @Relationship(deleteRule: .cascade) var items: [ReceiptItem]

       init(storeName: String, totalAmount: Double, scanDate: Date = Date()) {
           self.id = UUID()
           self.storeName = storeName
           self.totalAmount = totalAmount
           self.scanDate = scanDate
           self.items = []
       }
   }

   @Model
   final class Product {
       let id: UUID
       let name: String
       let category: ProductCategory
       let createdDate: Date
       @Relationship(deleteRule: .cascade) var priceHistory: [PriceRecord]

       init(name: String, category: ProductCategory) {
           self.id = UUID()
           self.name = name
           self.category = category
           self.createdDate = Date()
           self.priceHistory = []
       }
   }

   @Model
   final class PriceRecord {
       let id: UUID
       let productName: String
       let price: Double
       let storeName: String
       let recordDate: Date

       init(productName: String, price: Double, storeName: String, recordDate: Date = Date()) {
           self.id = UUID()
           self.productName = productName
           self.price = price
           self.storeName = storeName
           self.recordDate = recordDate
       }
   }
   ```

**Tasks:**

1. **Initialize iOS Project Structure**

   ```bash
   # Create proper iOS project structure in Xcode
   # Configure bundle identifier: eu.mpwg.allesteurer
   # Set deployment target: iOS 17.0
   # Enable required capabilities (Camera, Photo Library)
   ```

2. **Configure SwiftData Stack**

   ```swift
   // DataManager.swift - Central data management
   import SwiftData
   import SwiftUI
   import Foundation

   @Observable
   @MainActor
   class DataManager {
       static let shared = DataManager()

       private let modelContainer: ModelContainer
       private var modelContext: ModelContext { modelContainer.mainContext }

       init() {
           let schema = Schema([Receipt.self, Product.self, PriceRecord.self])
           let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

           do {
               modelContainer = try ModelContainer(for: schema, configurations: [configuration])
           } catch {
               fatalError("Failed to initialize ModelContainer: \(error)")
           }
       }

       func save() throws {
           if modelContext.hasChanges {
               try modelContext.save()
           }
       }
   }
   ```

3. **Set up iOS module structure**
   - Configure SwiftUI Views organized by feature
   - Set up proper View Models following MVVM pattern
   - Initialize Vision Framework integration
   - Set up Swift Charts for analytics

#### 2.2 SwiftData Database Operations

**Timeline:** Week 2  
**Effort:** 4 days  
**Dependencies:** Project setup

**Tasks:**

1. **Design database schema**

   ```sql
   -- commonMain/sqldelight/database/Receipt.sq
   CREATE TABLE Receipt (
       id TEXT PRIMARY KEY NOT NULL,
       storeName TEXT,
       totalAmount REAL NOT NULL,
       purchaseDate INTEGER NOT NULL,
       imageData BLOB,
       ocrText TEXT,
       isProcessed INTEGER NOT NULL DEFAULT 0
   );

   -- commonMain/sqldelight/database/Product.sq
   CREATE TABLE Product (
       id TEXT PRIMARY KEY NOT NULL,
       name TEXT NOT NULL,
       category TEXT,
       brand TEXT,
       createdAt INTEGER NOT NULL
   );

   -- commonMain/sqldelight/database/PriceRecord.sq
   CREATE TABLE PriceRecord (
       id TEXT PRIMARY KEY NOT NULL,
       productId TEXT NOT NULL,
       receiptId TEXT NOT NULL,
       price REAL NOT NULL,
       quantity REAL NOT NULL DEFAULT 1.0,
       recordedDate INTEGER NOT NULL,
       storeName TEXT NOT NULL,
       FOREIGN KEY (productId) REFERENCES Product(id),
       FOREIGN KEY (receiptId) REFERENCES Receipt(id)
   );
   ```

2. **Create data models and repositories**

   ```kotlin
   // commonMain/kotlin/data/models/Receipt.kt
   @Serializable
   data class Receipt(
       val id: String = UUID.randomUUID().toString(),
       val storeName: String? = null,
       val totalAmount: Double,
       val purchaseDate: Instant,
       val imageData: ByteArray? = null,
       val ocrText: String? = null,
       val isProcessed: Boolean = false,
       val items: List<ReceiptItem> = emptyList()
   )

   // commonMain/kotlin/data/models/Product.kt
   @Serializable
   data class Product(
       val id: String = UUID.randomUUID().toString(),
       val name: String,
       val category: String? = null,
       val brand: String? = null,
       val createdAt: Instant = Clock.System.now()
   )

   // commonMain/kotlin/data/repository/ReceiptRepository.kt
   interface ReceiptRepository {
       suspend fun insertReceipt(receipt: Receipt): Result<String>
       suspend fun getAllReceipts(): Flow<List<Receipt>>
       suspend fun getReceiptById(id: String): Receipt?
       suspend fun updateReceipt(receipt: Receipt): Result<Unit>
       suspend fun deleteReceipt(id: String): Result<Unit>
   }
   ```

### Phase 2: Platform-Specific OCR Implementation (Weeks 3-4)

#### 2.3 Expect/Actual OCR Interfaces

**Timeline:** Week 3  
**Effort:** 5 days  
**Dependencies:** Database setup

**Tasks:**

1. **Define shared OCR interface**

   ```kotlin
   // commonMain/kotlin/domain/ocr/OCRService.kt
   expect class OCRService {
       suspend fun processReceiptImage(imageData: ByteArray): Result<OCRResult>
       suspend fun processTextFromImage(imageData: ByteArray): Result<String>
   }

   @Serializable
   data class OCRResult(
       val rawText: String,
       val storeName: String? = null,
       val totalAmount: Double? = null,
       val purchaseDate: String? = null,
       val items: List<OCRItem> = emptyList(),
       val confidence: Float = 0.0f
   )

   @Serializable
   data class OCRItem(
       val name: String,
       val price: Double? = null,
       val quantity: Double = 1.0,
       val confidence: Float = 0.0f
   )
   ```

2. **iOS Vision Framework implementation**

   ```kotlin
   // iosMain/kotlin/platform/ocr/OCRService.kt
   actual class OCRService {
       actual suspend fun processReceiptImage(imageData: ByteArray): Result<OCRResult> {
           return withContext(Dispatchers.Default) {
               try {
                   val nsData = NSData.create(bytes = imageData.toCValues(), length = imageData.size.toULong())
                   val uiImage = UIImage.imageWithData(nsData) ?: return@withContext Result.failure(Exception("Invalid image data"))

                   val request = VNRecognizeTextRequest()
                   request.recognitionLevel = VNRequestTextRecognitionLevelAccurate
                   request.usesLanguageCorrection = true

                   val handler = VNImageRequestHandler(uiImage.CGImage, mapOf<Any?, Any>())
                   handler.performRequests(listOf(request))

                   val observations = request.results?.filterIsInstance<VNRecognizedTextObservation>()
                   val recognizedText = observations?.compactMap { it.topCandidates(1).firstOrNull()?.string }?.joined("\n") ?: ""

                   val ocrResult = parseReceiptText(recognizedText)
                   Result.success(ocrResult)
               } catch (e: Exception) {
                   Result.failure(e)
               }
           }
       }

       private fun parseReceiptText(text: String): OCRResult {
           // Implement German receipt parsing logic
           // Extract store name, total amount, date, and items
           return OCRResult(
               rawText = text,
               storeName = extractStoreName(text),
               totalAmount = extractTotalAmount(text),
               purchaseDate = extractPurchaseDate(text),
               items = extractItems(text)
           )
       }
   }
   ```

3. **Android ML Kit implementation**

   ```kotlin
   // androidMain/kotlin/platform/ocr/OCRService.kt
   actual class OCRService(private val context: Context) {
       actual suspend fun processReceiptImage(imageData: ByteArray): Result<OCRResult> {
           return withContext(Dispatchers.Default) {
               try {
                   val bitmap = BitmapFactory.decodeByteArray(imageData, 0, imageData.size)
                   val inputImage = InputImage.fromBitmap(bitmap, 0)

                   val recognizer = TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)

                   val result = recognizer.process(inputImage).await()
                   val recognizedText = result.text

                   val ocrResult = parseReceiptText(recognizedText)
                   Result.success(ocrResult)
               } catch (e: Exception) {
                   Result.failure(e)
               }
           }
       }

       private fun parseReceiptText(text: String): OCRResult {
           // Implement German receipt parsing logic for Android
           // Similar logic as iOS but adapted for ML Kit results
           return OCRResult(
               rawText = text,
               storeName = extractStoreName(text),
               totalAmount = extractTotalAmount(text),
               purchaseDate = extractPurchaseDate(text),
               items = extractItems(text)
           )
       }
   }
   ```

### Phase 2: Receipt Scanning & OCR (Weeks 3-5)

#### 2.3 Camera Integration

**Timeline:** Week 3  
**Effort:** 4 days  
**Dependencies:** SwiftData setup

**Tasks:**

#### 2.4 Camera Integration (Expect/Actual)

**Timeline:** Week 4  
**Effort:** 5 days  
**Dependencies:** OCR interfaces

**Tasks:**

1. **Define shared camera interface**

   ```kotlin
   // commonMain/kotlin/domain/camera/CameraService.kt
   expect class CameraService {
       suspend fun requestCameraPermission(): Boolean
       suspend fun captureReceiptImage(): Result<ByteArray>
       fun isCameraAvailable(): Boolean
   }

   data class CameraPermissionState(
       val isGranted: Boolean = false,
       val shouldShowRationale: Boolean = false,
       val isPermanentlyDenied: Boolean = false
   )
   ```

2. **iOS camera implementation**

   ```kotlin
   // iosMain/kotlin/platform/camera/CameraService.kt
   actual class CameraService {
       actual suspend fun requestCameraPermission(): Boolean {
           return withContext(Dispatchers.Main) {
               when (AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)) {
                   AVAuthorizationStatusAuthorized -> true
                   AVAuthorizationStatusNotDetermined -> {
                       suspendCoroutine { continuation ->
                           AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo) { granted ->
                               continuation.resume(granted)
                           }
                       }
                   }
                   else -> false
               }
           }
       }

       actual suspend fun captureReceiptImage(): Result<ByteArray> {
           return try {
               val imagePickerController = UIImagePickerController()
               imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera
               imagePickerController.allowsEditing = false

               // Implementation would use UIImagePickerController delegate
               // Convert UIImage to ByteArray
               val imageData = captureImageFromCamera()
               Result.success(imageData)
           } catch (e: Exception) {
               Result.failure(e)
           }
       }
   }
   ```

3. **Android camera implementation**

   ```kotlin
   // androidMain/kotlin/platform/camera/CameraService.kt
   actual class CameraService(private val context: Context) {
       actual suspend fun requestCameraPermission(): Boolean {
           return when {
               ContextCompat.checkSelfPermission(context, Manifest.permission.CAMERA) ==
               PackageManager.PERMISSION_GRANTED -> true
               else -> {
                   // Use ActivityResultLauncher in actual implementation
                   requestCameraPermissionInternal()
               }
           }
       }

       actual suspend fun captureReceiptImage(): Result<ByteArray> {
           return try {
               val imageCapture = ImageCapture.Builder().build()
               val outputFileOptions = ImageCapture.OutputFileOptions.Builder(createTempFile()).build()

               // Use CameraX to capture image
               val imageData = captureImageWithCameraX(imageCapture, outputFileOptions)
               Result.success(imageData)
           } catch (e: Exception) {
               Result.failure(e)
           }
       }
   }
   ```

### Phase 3: Shared Business Logic Implementation (Weeks 5-6)

#### 2.5 ViewModels and Use Cases

**Timeline:** Week 5  
**Effort:** 5 days  
**Dependencies:** Platform implementations

**Tasks:**

1. **Receipt processing use cases**

   ```kotlin
   // commonMain/kotlin/domain/usecase/ProcessReceiptUseCase.kt
   class ProcessReceiptUseCase(
       private val ocrService: OCRService,
       private val receiptRepository: ReceiptRepository,
       private val productRepository: ProductRepository,
       private val productMatcher: ProductMatcher
   ) {
       suspend fun execute(imageData: ByteArray): Result<Receipt> {
           return try {
               // Process image with OCR
               val ocrResult = ocrService.processReceiptImage(imageData).getOrThrow()

               // Create receipt from OCR data
               val receipt = Receipt(
                   storeName = ocrResult.storeName,
                   totalAmount = ocrResult.totalAmount ?: 0.0,
                   purchaseDate = parseDate(ocrResult.purchaseDate) ?: Clock.System.now(),
                   ocrText = ocrResult.rawText,
                   imageData = imageData
               )

               // Save receipt
               receiptRepository.insertReceipt(receipt)

               // Process individual items
               processReceiptItems(receipt, ocrResult.items)

               Result.success(receipt)
           } catch (e: Exception) {
               Result.failure(e)
           }
       }

       private suspend fun processReceiptItems(receipt: Receipt, ocrItems: List<OCRItem>) {
           ocrItems.forEach { ocrItem ->
               val product = productMatcher.findOrCreateProduct(
                   name = ocrItem.name,
                   category = categorizeProduct(ocrItem.name)
               )

               val priceRecord = PriceRecord(
                   productId = product.id,
                   receiptId = receipt.id,
                   price = ocrItem.price ?: 0.0,
                   quantity = ocrItem.quantity,
                   recordedDate = receipt.purchaseDate,
                   storeName = receipt.storeName ?: ""
               )

               // Save price record (implement repository method)
           }
       }
   }
   ```

2. **Shared ViewModels**

   ```kotlin
   // commonMain/kotlin/presentation/viewmodel/ReceiptScannerViewModel.kt
   class ReceiptScannerViewModel(
       private val processReceiptUseCase: ProcessReceiptUseCase,
       private val cameraService: CameraService
   ) : ViewModel() {

       private val _uiState = MutableStateFlow(ReceiptScannerState())
       val uiState = _uiState.asStateFlow()

       fun requestCameraPermission() {
           viewModelScope.launch {
               _uiState.value = _uiState.value.copy(isRequestingPermission = true)
               val granted = cameraService.requestCameraPermission()
               _uiState.value = _uiState.value.copy(
                   isRequestingPermission = false,
                   isCameraPermissionGranted = granted
               )
           }
       }

       fun captureAndProcessReceipt() {
           viewModelScope.launch {
               _uiState.value = _uiState.value.copy(isProcessing = true)

               try {
                   val imageData = cameraService.captureReceiptImage().getOrThrow()
                   val receipt = processReceiptUseCase.execute(imageData).getOrThrow()

                   _uiState.value = _uiState.value.copy(
                       isProcessing = false,
                       processedReceipt = receipt,
                       showSuccess = true
                   )
               } catch (e: Exception) {
                   _uiState.value = _uiState.value.copy(
                       isProcessing = false,
                       error = e.message
                   )
               }
           }
       }
   }

   data class ReceiptScannerState(
       val isProcessing: Boolean = false,
       val isRequestingPermission: Boolean = false,
       val isCameraPermissionGranted: Boolean = false,
       val processedReceipt: Receipt? = null,
       val showSuccess: Boolean = false,
       val error: String? = null
   )
   ```

3. **Product matching algorithms**

   ```kotlin
   // commonMain/kotlin/domain/matching/ProductMatcher.kt
   class ProductMatcher(
       private val productRepository: ProductRepository
   ) {
       suspend fun findOrCreateProduct(name: String, category: String? = null): Product {
           // First, try to find existing product with fuzzy matching
           val existingProduct = findSimilarProduct(name)
           if (existingProduct != null) {
               return existingProduct
           }

           // Create new product if no match found
           val newProduct = Product(
               name = normalizeProductName(name),
               category = category,
               brand = extractBrand(name)
           )

           productRepository.insertProduct(newProduct)
           return newProduct
       }

       private suspend fun findSimilarProduct(name: String): Product? {
           val normalizedName = normalizeProductName(name)
           val allProducts = productRepository.getAllProducts()

           return allProducts.firstOrNull { product ->
               calculateSimilarity(normalizedName, product.name) > 0.85
   ```

### Phase 4: Compose Multiplatform UI Implementation (Weeks 7-8)

#### 2.6 Shared UI Components

**Timeline:** Week 7  
**Effort:** 5 days  
**Dependencies:** ViewModels and use cases

**Tasks:**

1.  **Design system and theming**

    ```kotlin
    // commonMain/kotlin/ui/theme/Theme.kt
    @Composable
    fun AllesTeurerTheme(
        darkTheme: Boolean = isSystemInDarkTheme(),
        dynamicColor: Boolean = true,
        content: @Composable () -> Unit
    ) {
        val colorScheme = when {
            dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
                val context = LocalContext.current
                if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
            }
            darkTheme -> DarkColorScheme
            else -> LightColorScheme
        }

        MaterialTheme(
            colorScheme = colorScheme,
            typography = Typography,
            content = content
        )
    }

    // Color schemes
    private val DarkColorScheme = darkColorScheme(
        primary = Purple80,
        secondary = PurpleGrey80,
        tertiary = Pink80
    )

    private val LightColorScheme = lightColorScheme(
        primary = Purple40,
        secondary = PurpleGrey40,
        tertiary = Pink40
    )
    ```

2.  **Shared navigation**

    ```kotlin
    // commonMain/kotlin/ui/navigation/Navigation.kt
    @Composable
    fun AllesTeurerNavigation() {
        val navController = rememberNavController()

        NavHost(
            navController = navController,
            startDestination = Screen.ReceiptScanner.route
        ) {
            composable(Screen.ReceiptScanner.route) {
                ReceiptScannerScreen(
                    onNavigateToHistory = {
                        navController.navigate(Screen.ReceiptHistory.route)
                    }
                )
            }

            composable(Screen.ReceiptHistory.route) {
                ReceiptHistoryScreen(
                    onNavigateBack = { navController.popBackStack() },
                    onNavigateToDetail = { receiptId ->
                        navController.navigate("${Screen.ReceiptDetail.route}/$receiptId")
                    }
                )
            }

            composable(
                route = "${Screen.ReceiptDetail.route}/{receiptId}",
                arguments = listOf(navArgument("receiptId") { type = NavType.StringType })
            ) { backStackEntry ->
                val receiptId = backStackEntry.arguments?.getString("receiptId") ?: ""
                ReceiptDetailScreen(
                    receiptId = receiptId,
                    onNavigateBack = { navController.popBackStack() }
                )
            }

            composable(Screen.ProductList.route) {
                ProductListScreen(
                    onNavigateToDetail = { productId ->
                        navController.navigate("${Screen.ProductDetail.route}/$productId")
                    }
                )
            }

            composable(Screen.Analytics.route) {
                AnalyticsScreen()
            }
        }
    }

    sealed class Screen(val route: String) {
        object ReceiptScanner : Screen("receipt_scanner")
        object ReceiptHistory : Screen("receipt_history")
        object ReceiptDetail : Screen("receipt_detail")
        object ProductList : Screen("product_list")
        object ProductDetail : Screen("product_detail")
        object Analytics : Screen("analytics")
    }
    ```

3.  **Receipt scanner screen**

    ```kotlin
    // commonMain/kotlin/ui/screens/ReceiptScannerScreen.kt
    @Composable
    fun ReceiptScannerScreen(
        viewModel: ReceiptScannerViewModel = koinViewModel(),
        onNavigateToHistory: () -> Unit = {}
    ) {
        val uiState by viewModel.uiState.collectAsState()

        LaunchedEffect(Unit) {
            viewModel.requestCameraPermission()
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            when {
                uiState.isRequestingPermission -> {
                    CircularProgressIndicator()
                    Text(
                        text = "Kamera-Berechtigung wird angefordert...",
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.padding(top = 16.dp)
                    )
                }

                !uiState.isCameraPermissionGranted -> {
                    Icon(
                        imageVector = Icons.Default.CameraAlt,
                        contentDescription = "Kamera",
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "Kamera-Berechtigung erforderlich",
                        style = MaterialTheme.typography.headlineSmall,
                        modifier = Modifier.padding(16.dp)
                    )
                    Text(
                        text = "Um Kassenbons zu scannen, benötigt die App Zugriff auf Ihre Kamera.",
                        style = MaterialTheme.typography.bodyMedium,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.padding(bottom = 16.dp)
                    )
                    Button(onClick = { viewModel.requestCameraPermission() }) {
                        Text("Berechtigung erteilen")
                    }
                }

                uiState.isProcessing -> {
                    CircularProgressIndicator()
                    Text(
                        text = "Kassenbon wird verarbeitet...",
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.padding(top = 16.dp)
                    )
                }

                else -> {
                    Icon(
                        imageVector = Icons.Default.CameraAlt,
                        contentDescription = "Kassenbon scannen",
                        modifier = Modifier.size(96.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )

                    Text(
                        text = "Kassenbon scannen",
                        style = MaterialTheme.typography.headlineSmall,
                        modifier = Modifier.padding(16.dp)
                    )

                    Text(
                        text = "Fotografieren Sie Ihren Kassenbon, um Produkte und Preise automatisch zu erfassen.",
                        style = MaterialTheme.typography.bodyMedium,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.padding(bottom = 32.dp)
                    )

                    Button(
                        onClick = { viewModel.captureAndProcessReceipt() },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(56.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.CameraAlt,
                            contentDescription = null,
                            modifier = Modifier.padding(end = 8.dp)
                        )
                        Text("Kassenbon fotografieren")
                    }

                    OutlinedButton(
                        onClick = onNavigateToHistory,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(top = 16.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.History,
                            contentDescription = null,
                            modifier = Modifier.padding(end = 8.dp)
                        )
                        Text("Verlauf anzeigen")
                    }
                }
            }
        }

        // Handle success state
        if (uiState.showSuccess) {
            LaunchedEffect(uiState.processedReceipt) {
                // Show success feedback and navigate
                onNavigateToHistory()
            }
        }

        // Handle error state
        uiState.error?.let { error ->
            LaunchedEffect(error) {
                // Show error snackbar or dialog
            }
        }
    }
    ```

        private func parseReceiptLine(_ line: String) -> ReceiptItem? {
            // Implement receipt line parsing logic
            // Look for patterns like "Product Name 2.99" or "2x Product 5.98"

#### 2.7 Analytics and Charts Implementation

**Timeline:** Week 8  
**Effort:** 5 days  
**Dependencies:** Shared UI components

**Tasks:**

1. **Price analytics screens**

   ```kotlin
   // commonMain/kotlin/ui/screens/AnalyticsScreen.kt
   @Composable
   fun AnalyticsScreen(
       viewModel: AnalyticsViewModel = koinViewModel()
   ) {
       val uiState by viewModel.uiState.collectAsState()

       LazyColumn(
           modifier = Modifier
               .fillMaxSize()
               .padding(16.dp),
           verticalArrangement = Arrangement.spacedBy(16.dp)
       ) {
           item {
               Text(
                   text = "Preisanalyse",
                   style = MaterialTheme.typography.headlineMedium
               )
           }

           item {
               InflationCard(inflationRate = uiState.inflationRate)
           }

           item {
               SpendingTrendsChart(trends = uiState.spendingTrends)
           }

           item {
               CategoryBreakdownCard(breakdown = uiState.categoryBreakdown)
           }

           items(uiState.topProducts) { product ->
               ProductPriceCard(
                   product = product,
                   priceHistory = uiState.priceHistories[product.id] ?: emptyList()
               )
           }
       }
   }

   @Composable
   fun SpendingTrendsChart(trends: List<SpendingTrend>) {
       Card(
           modifier = Modifier.fillMaxWidth()
       ) {
           Column(
               modifier = Modifier.padding(16.dp)
           ) {
               Text(
                   text = "Ausgabentrends",
                   style = MaterialTheme.typography.titleMedium,
                   modifier = Modifier.padding(bottom = 8.dp)
               )

               // Use compose-charts or similar for multiplatform charts
               SimpleLineChart(
                   data = trends,
                   modifier = Modifier
                       .fillMaxWidth()
                       .height(200.dp)
               )
           }
       }
   }
   ```

2. **Local analytics calculations**

   ```kotlin
   // commonMain/kotlin/domain/usecase/CalculateAnalyticsUseCase.kt
   class CalculateAnalyticsUseCase(
       private val receiptRepository: ReceiptRepository,
       private val productRepository: ProductRepository,
       private val priceRecordRepository: PriceRecordRepository
   ) {
       suspend fun calculateInflationRate(
           category: String? = null,
           periodDays: Int = 365
       ): Double {
           val endDate = Clock.System.now()
           val startDate = endDate.minus(periodDays.days)

           val priceRecords = priceRecordRepository.getPriceRecordsInPeriod(
               startDate = startDate,
               endDate = endDate,
               category = category
           )

           if (priceRecords.size < 2) return 0.0

           val sortedRecords = priceRecords.sortedBy { it.recordedDate }
           val averageStartPrice = sortedRecords.take(sortedRecords.size / 4).map { it.price }.average()
           val averageEndPrice = sortedRecords.takeLast(sortedRecords.size / 4).map { it.price }.average()

           return ((averageEndPrice - averageStartPrice) / averageStartPrice) * 100
       }

       suspend fun calculateSpendingTrends(): List<SpendingTrend> {
           val receipts = receiptRepository.getAllReceipts().first()
           val monthlySpending = receipts.groupBy {
               val instant = Instant.fromEpochMilliseconds(it.purchaseDate.toEpochMilliseconds())
               "${instant.toLocalDateTime(TimeZone.currentSystemDefault()).year}-${instant.toLocalDateTime(TimeZone.currentSystemDefault()).monthNumber}"
           }.mapValues { (_, receipts) ->
               receipts.sumOf { it.totalAmount }
           }

           return monthlySpending.map { (month, amount) ->
               SpendingTrend(period = month, amount = amount)
           }.sortedBy { it.period }
       }
   }
   ```

### Phase 5: Testing and Quality Assurance (Week 9)

#### 2.8 Comprehensive Testing Strategy

**Timeline:** Week 9  
**Effort:** 5 days  
**Dependencies:** UI implementation complete

**Tasks:**

1. **Unit tests for shared business logic**

   ```kotlin
   // commonTest/kotlin/domain/usecase/ProcessReceiptUseCaseTest.kt
   class ProcessReceiptUseCaseTest {

       @Test
       fun `processReceipt should successfully extract receipt data`() = runTest {
           // Given
           val mockOcrService = mockk<OCRService>()
           val mockReceiptRepository = mockk<ReceiptRepository>()
           val mockProductMatcher = mockk<ProductMatcher>()

           val ocrResult = OCRResult(
               rawText = "REWE\nMilch 1.49\nBrot 2.99\nSumme: 4.48",
               storeName = "REWE",
               totalAmount = 4.48,
               items = listOf(
                   OCRItem("Milch", 1.49),
                   OCRItem("Brot", 2.99)
               )
           )

           every { mockOcrService.processReceiptImage(any()) } returns Result.success(ocrResult)
           every { mockReceiptRepository.insertReceipt(any()) } returns Result.success("test-id")
           every { mockProductMatcher.findOrCreateProduct(any(), any()) } returns Product(
               name = "Test Product"
           )

           val useCase = ProcessReceiptUseCase(
               mockOcrService,
               mockReceiptRepository,
               mockk(),
               mockProductMatcher
           )

           // When
           val result = useCase.execute(byteArrayOf())

           // Then
           assertTrue(result.isSuccess)
           verify { mockOcrService.processReceiptImage(any()) }
           verify { mockReceiptRepository.insertReceipt(any()) }
       }
   }
   ```

2. **Platform-specific integration tests**

   ```kotlin
   // androidTest/kotlin/platform/ocr/OCRServiceTest.kt
   @RunWith(AndroidJUnit4::class)
   class AndroidOCRServiceTest {

       @Test
       fun ocrService_shouldProcessGermanReceipt() = runTest {
           val context = InstrumentationRegistry.getInstrumentation().targetContext
           val ocrService = OCRService(context)

           // Load test receipt image
           val testImageData = loadTestReceiptImage()

           val result = ocrService.processReceiptImage(testImageData)

           assertTrue(result.isSuccess)
           val ocrResult = result.getOrNull()
           assertNotNull(ocrResult)
           assertTrue(ocrResult.rawText.isNotEmpty())
       }
   }
   ```

3. **UI tests with Compose testing**

   ```kotlin
   // commonTest/kotlin/ui/screens/ReceiptScannerScreenTest.kt
   class ReceiptScannerScreenTest {

       @get:Rule
       val composeTestRule = createComposeRule()

       @Test
       fun receiptScannerScreen_showsCameraPermissionRequest() {
           // Given
           val mockViewModel = mockk<ReceiptScannerViewModel>()
           every { mockViewModel.uiState } returns flowOf(
               ReceiptScannerState(isCameraPermissionGranted = false)
           ).asStateFlow()

           // When
           composeTestRule.setContent {
               ReceiptScannerScreen(viewModel = mockViewModel)
           }

           // Then
           composeTestRule
               .onNodeWithText("Kamera-Berechtigung erforderlich")
               .assertIsDisplayed()
           composeTestRule
               .onNodeWithText("Berechtigung erteilen")
               .assertIsDisplayed()
       }
   }
   ```

### Phase 6: Deployment and App Store Preparation (Week 10)

#### 2.9 Platform-Specific App Store Setup

**Timeline:** Week 10  
**Effort:** 3 days  
**Dependencies:** Testing complete

**Tasks:**

1. **iOS App Store preparation**

   ```kotlin
   // Configure iOS app bundle in iosApp/Configuration/Config.xcconfig
   PRODUCT_BUNDLE_IDENTIFIER = eu.mpwg.allesteurer
   MARKETING_VERSION = 1.0.0
   CURRENT_PROJECT_VERSION = 1

   IPHONEOS_DEPLOYMENT_TARGET = 15.0
   TARGETED_DEVICE_FAMILY = 1 // iPhone only initially

   // Privacy usage descriptions
   NSCameraUsageDescription = Diese App benötigt Kamera-Zugriff zum Scannen von Kassenbons
   NSPhotoLibraryUsageDescription = Diese App benötigt Zugriff auf Ihre Fotobibliothek zum Importieren von Kassenbon-Bildern
   ```

2. **Android Play Store preparation**

   ```kotlin
   // androidApp/src/main/AndroidManifest.xml
   <uses-permission android:name="android.permission.CAMERA" />
   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

   <application
       android:name=".AllesTeurerApplication"
       android:allowBackup="false"
       android:icon="@mipmap/ic_launcher"
       android:label="@string/app_name"
       android:theme="@style/AppTheme">

       <activity
           android:name=".MainActivity"
           android:exported="true"
           android:theme="@style/AppTheme.NoActionBar">
           <intent-filter>
               <action android:name="android.intent.action.MAIN" />
               <category android:name="android.intent.category.LAUNCHER" />
           </intent-filter>
       </activity>
   </application>
   ```

3. **CI/CD pipeline setup**

   ```yaml
   # .github/workflows/build-and-test.yml
   name: Build and Test KMP App

   on:
     push:
       branches: [main, develop]
     pull_request:
       branches: [main]

   jobs:
     test-shared:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - uses: actions/setup-java@v3
           with:
             java-version: "17"
             distribution: "temurin"
         - name: Test shared code
           run: ./gradlew testDebugUnitTest

     build-android:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - name: Build Android APK
           run: ./gradlew assembleDebug

     build-ios:
       runs-on: macos-latest
       steps:
         - uses: actions/checkout@v3
         - name: Build iOS
           run: |
             cd iosApp
             xcodebuild -project iosApp.xcodeproj -scheme iosApp -sdk iphonesimulator
   ```

## 3. Technology Integration Specifications

### 3.1 SQLDelight Database Schema

```sql
-- Database schema for cross-platform local storage
-- commonMain/sqldelight/database/AllesTeurer.sq

CREATE TABLE Receipt (
    id TEXT PRIMARY KEY NOT NULL,
    storeName TEXT,
    totalAmount REAL NOT NULL,
    purchaseDate INTEGER NOT NULL, -- Unix timestamp
    imageData BLOB,
    ocrText TEXT,
    isProcessed INTEGER NOT NULL DEFAULT 0,
    createdAt INTEGER NOT NULL,
    updatedAt INTEGER NOT NULL
);

CREATE TABLE Product (
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    normalizedName TEXT NOT NULL, -- For matching algorithms
    category TEXT,
    brand TEXT,
    createdAt INTEGER NOT NULL,
    updatedAt INTEGER NOT NULL
);

CREATE TABLE PriceRecord (
    id TEXT PRIMARY KEY NOT NULL,
    productId TEXT NOT NULL,
    receiptId TEXT NOT NULL,
    price REAL NOT NULL,
    quantity REAL NOT NULL DEFAULT 1.0,
    unit TEXT, -- kg, pcs, liter, etc.
    recordedDate INTEGER NOT NULL,
    storeName TEXT NOT NULL,
    createdAt INTEGER NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(id) ON DELETE CASCADE,
    FOREIGN KEY (receiptId) REFERENCES Receipt(id) ON DELETE CASCADE
);

CREATE TABLE Category (
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    color TEXT, -- Hex color for UI
    iconName TEXT,
    parentCategoryId TEXT,
    createdAt INTEGER NOT NULL,
    FOREIGN KEY (parentCategoryId) REFERENCES Category(id)
);

-- Indexes for performance
CREATE INDEX idx_receipt_purchase_date ON Receipt(purchaseDate);
CREATE INDEX idx_price_record_product_id ON PriceRecord(productId);
CREATE INDEX idx_price_record_recorded_date ON PriceRecord(recordedDate);
CREATE INDEX idx_product_normalized_name ON Product(normalizedName);

-- Queries
selectAllReceipts:
SELECT * FROM Receipt ORDER BY purchaseDate DESC;

selectReceiptById:
SELECT * FROM Receipt WHERE id = ?;

selectProductsByCategory:
SELECT * FROM Product WHERE category = ? ORDER BY name ASC;

selectPriceHistoryForProduct:
SELECT pr.*, r.storeName, r.purchaseDate
FROM PriceRecord pr
JOIN Receipt r ON pr.receiptId = r.id
WHERE pr.productId = ?
ORDER BY pr.recordedDate ASC;

insertReceipt:
INSERT INTO Receipt (id, storeName, totalAmount, purchaseDate, imageData, ocrText, isProcessed, createdAt, updatedAt)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);

insertProduct:
INSERT INTO Product (id, name, normalizedName, category, brand, createdAt, updatedAt)
VALUES (?, ?, ?, ?, ?, ?, ?);

insertPriceRecord:
INSERT INTO PriceRecord (id, productId, receiptId, price, quantity, unit, recordedDate, storeName, createdAt)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
```

## 4. Privacy and Security Implementation

### 4.1 Data Privacy Framework

```kotlin
// commonMain/kotlin/domain/privacy/PrivacyManager.kt
class PrivacyManager {

    fun anonymizeReceiptData(receipt: Receipt): Receipt {
        return receipt.copy(
            imageData = null, // Remove raw image data if requested
            ocrText = receipt.ocrText?.anonymizePersonalInfo()
        )
    }

    fun exportUserData(): UserDataExport {
        // GDPR Article 20 - Data portability
        return UserDataExport(
            receipts = getAllReceipts(),
            products = getAllProducts(),
            priceRecords = getAllPriceRecords(),
            analytics = calculateUserAnalytics(),
            exportDate = Clock.System.now()
        )
    }

    suspend fun deleteAllUserData(): Result<Unit> {
        // GDPR Article 17 - Right to erasure
        return try {
            receiptRepository.deleteAllReceipts()
            productRepository.deleteAllProducts()
            priceRecordRepository.deleteAllRecords()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
```

## 5. Future Roadmap and Evolution

### 5.1 Backend Integration Preparation

```kotlin
// Future backend integration points
// commonMain/kotlin/domain/sync/SyncManager.kt
interface SyncManager {
    suspend fun syncReceiptsToCloud(): Result<Unit>
    suspend fun syncProductsFromCloud(): Result<List<Product>>
    suspend fun backupUserData(): Result<String> // Returns backup ID
    suspend fun restoreUserData(backupId: String): Result<Unit>
}
```

### 5.2 Desktop Platform Support

The KMP architecture already supports desktop platforms through Compose Desktop. Future expansion would include:

- Desktop-specific UI adaptations
- File system integrations for bulk receipt import
- Advanced analytics with larger screen real estate
- Keyboard shortcuts and desktop-specific UX patterns

## 6. Success Metrics and KPIs

### 6.1 Technical Metrics

- **Code Sharing**: Target 85%+ shared business logic between platforms
- **Performance**: App launch < 2 seconds, OCR processing < 5 seconds
- **Database Performance**: All queries < 100ms
- **Test Coverage**: > 80% for shared code, > 70% for platform code

### 6.2 User Experience Metrics

- **OCR Accuracy**: > 90% accurate product recognition
- **User Retention**: > 70% monthly active users after 3 months
- **Feature Adoption**: > 60% users scan receipts regularly
- **Privacy Satisfaction**: > 95% users satisfied with local-only approach

## Conclusion

This implementation plan provides a comprehensive roadmap for developing AllesTeurer as a Kotlin Multiplatform application that maximizes code sharing while delivering native performance and user experience on both iOS and Android platforms. The privacy-first, local-processing approach ensures user data remains secure while providing powerful price tracking and analytics capabilities.

The phased development approach allows for iterative improvements and user feedback integration, while the clean architecture ensures the codebase remains maintainable and extensible for future enhancements.
totalAmount: Decimal
purchaseDate: Date
imageData: Data?
ocrText: String?
isProcessed: Bool
createdAt: Date
updatedAt: Date

    // Relationships
    items: [ReceiptItem] (One-to-Many)

}

// Product Entity
entity Product {
id: UUID
name: String
category: String?
brand: String?
normalizedName: String // For matching
createdAt: Date
updatedAt: Date

    // Relationships
    priceRecords: [PriceRecord] (One-to-Many)

}

// PriceRecord Entity
entity PriceRecord {
id: UUID
price: Decimal
quantity: Decimal
unitPrice: Decimal
recordedDate: Date
storeName: String
createdAt: Date

    // Relationships
    product: Product (Many-to-One)
    receipt: Receipt (Many-to-One)

}

// ReceiptItem Entity
entity ReceiptItem {
id: UUID
itemName: String
extractedPrice: Decimal
extractedQuantity: Decimal?
lineText: String // Original OCR text
isMatched: Bool
createdAt: Date

    // Relationships
    receipt: Receipt (Many-to-One)
    product: Product? (Many-to-One, optional)

}

// Store Entity
entity Store {
id: UUID
name: String
location: String?
logoImage: Data?
createdAt: Date

    // Relationships
    receipts: [Receipt] (One-to-Many)
    priceRecords: [PriceRecord] (One-to-Many)

}

// Category Entity
entity Category {
id: UUID
name: String
iconName: String?
colorHex: String?
sortOrder: Int32

    // Relationships
    products: [Product] (One-to-Many)

}

````

### 3.2 CloudKit Integration Schema

```swift
// CloudKit Record Types (for device sync)

// CKRecord: Receipt
recordType: "Receipt"
fields: [
    "storeName": CKRecord.Reference,
    "totalAmount": NSNumber,
    "purchaseDate": Date,
    "imageAsset": CKAsset,
    "ocrText": String,
    "isProcessed": Bool
]

// CKRecord: Product
recordType: "Product"
fields: [
    "name": String,
    "category": CKRecord.Reference,
    "brand": String,
    "normalizedName": String
]

// CKRecord: PriceRecord
recordType: "PriceRecord"
fields: [
    "product": CKRecord.Reference,
    "receipt": CKRecord.Reference,
    "price": NSNumber,
    "quantity": NSNumber,
    "recordedDate": Date,
    "storeName": String
]
````

## 4. Advanced Features Implementation

### 4.1 Apple Intelligence Integration

```swift
// Services/IntelligenceService.swift
import SwiftUI
import NaturalLanguage

@Observable
class IntelligenceService {
    private let categorizer = NLModel(mlModel: try! CategoryClassifier(configuration: .init()).model)

    func categorizeProduct(_ productName: String) async -> String {
        let prediction = try? categorizer.prediction(from: productName)
        return prediction?.label ?? "Other"
    }

    func extractProductInfo(_ ocrText: String) async -> [ProductInfo] {
        let tagger = NLTagger(tagSchemes: [.nameType, .lexicalClass])
        tagger.string = ocrText

        var products: [ProductInfo] = []

        tagger.enumerateTagsInRange(ocrText.startIndex..<ocrText.endIndex,
                                   unit: .word,
                                   scheme: .nameType) { tag, range in
            // Extract product names and prices using NLP
            return true
        }

        return products
    }
}

struct ProductInfo {
    let name: String
    let price: Decimal?
    let quantity: String?
    let confidence: Double
}
```

### 4.2 Local Search & Matching

```swift
// Services/LocalSearchService.swift
import SwiftUI
import Foundation

@Observable
class LocalSearchService {
    private let dataManager = DataManager.shared

    func searchProducts(query: String) async -> [Product] {
        let products = dataManager.fetchProducts()
        return products.filter { product in
            product.name.localizedCaseInsensitiveContains(query) ||
            product.brand?.localizedCaseInsensitiveContains(query) == true ||
            product.category?.localizedCaseInsensitiveContains(query) == true
        }.sorted { lhs, rhs in
            // Sort by relevance score
            relevanceScore(query, lhs.name) > relevanceScore(query, rhs.name)
        }
    }

    private func relevanceScore(_ query: String, _ text: String) -> Double {
        // Implement string similarity algorithm
        let distance = levenshteinDistance(query.lowercased(), text.lowercased())
        return 1.0 - Double(distance) / Double(max(query.count, text.count))
    }

    private func levenshteinDistance(_ s1: String, _ s2: String) -> Int {
        // Implement Levenshtein distance algorithm
        let m = s1.count, n = s2.count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        for i in 0...m { dp[i][0] = i }
        for j in 0...n { dp[0][j] = j }

        for i in 1...m {
            for j in 1...n {
                if Array(s1)[i-1] == Array(s2)[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                }
            }
        }

        return dp[m][n]
    }
}
```

## 5. Future Evolution Strategy

### Phase 7: Backend Integration Preparation (Future)

When ready to add backend services, the iOS app architecture supports easy integration:

#### 5.1 Network Layer Addition

```swift
// Services/NetworkService.swift (Future)
import SwiftUI

@Observable
class NetworkService {
    private let baseURL = URL(string: "https://api.allesteuer.com")!

    func syncWithBackend() async {
        // Sync local SwiftData with backend
        await uploadPendingReceipts()
        await downloadLatestPriceData()
        await syncUserPreferences()
    }

    func uploadPendingReceipts() async {
        // Upload receipts that haven't been synced
    }

    func downloadLatestPriceData() async {
        // Download price comparison data from backend
    }
}
```

#### 5.2 Multi-Platform Expansion

- **Android App**: Kotlin + Room Database + Retrofit
- **Web App**: Next.js + React + IndexedDB
- **Backend**: Node.js + GraphQL + PostgreSQL

#### 5.3 Real-Time Price Monitoring

```swift
// Future: Real-time price tracking integration
class PriceMonitoringService {
    func startMonitoring(products: [Product]) async {
        // Connect to backend price monitoring service
        // Receive push notifications for price changes
    }

    func getExternalPrices(product: Product) async -> [ExternalPrice] {
        // Query external APIs (Amazon, eBay, etc.)
        return []
    }
}

struct ExternalPrice {
    let retailer: String
    let price: Decimal
    let url: String
    let availability: String
}
```

## 6. Testing Strategy

### 6.1 Unit Testing

```swift
// AllesTeurerTests/OCRServiceTests.swift
import XCTest
@testable import AllesTeurer

class OCRServiceTests: XCTestCase {
    var ocrService: OCRService!

    override func setUp() {
        super.setUp()
        ocrService = OCRService()
    }

    func testReceiptTextParsing() async {
        let sampleReceiptText = """
        REWE Markt
        Milch 1,5% 1,29
        Brot Vollkorn 2,49
        Äpfel 1kg 3,99
        SUMME 7,77
        """

        let result = await ocrService.parseReceiptText(sampleReceiptText)

        XCTAssertEqual(result.items.count, 3)
        XCTAssertEqual(result.totalAmount, Decimal(7.77))
        XCTAssertEqual(result.storeName, "REWE")
    }

    func testProductMatching() async {
        // Create test products in SwiftData
        let context = DataManager.shared.modelContext
        let milk = Product(name: "Milch 1,5%", category: "Dairy")
        context.insert(milk)

        try! context.save()

        // Test matching
        let matcher = ProductMatcher()
        let matched = await matcher.findSimilarProduct(name: "Milch 1,5%")

        XCTAssertNotNil(matched)
        XCTAssertEqual(matched?.name, "Milch 1,5%")
    }
}
```

### 6.2 UI Testing

```swift
// AllesTeurerUITests/ReceiptScanningTests.swift
import XCTest

class ReceiptScanningUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }

    func testReceiptScanningFlow() {
        // Navigate to scanner
        app.tabBars.buttons["Scan"].tap()

        // Test camera permission request
        if app.alerts.element.exists {
            app.alerts.buttons["OK"].tap()
        }

        // Test scan button exists
        XCTAssertTrue(app.buttons["Scan Receipt"].exists)

        // Test results view navigation
        app.buttons["Scan Receipt"].tap()
        // Add more UI tests...
    }
}
```

## 7. Performance & Optimization

### 7.1 SwiftData Optimization

```swift
// Optimized SwiftData fetching
extension DataManager {
    func fetchRecentReceipts(limit: Int = 20) -> [Receipt] {
        let descriptor = FetchDescriptor<Receipt>(
            sortBy: [SortDescriptor(\.purchaseDate, order: .reverse)]
        )
        descriptor.fetchLimit = limit
        // SwiftData automatically optimizes relationship loading

        return (try? modelContext.fetch(descriptor)) ?? []
    }

    func fetchProductsWithPriceHistory() -> [Product] {
        let descriptor = FetchDescriptor<Product>(
            predicate: #Predicate<Product> { product in
                !product.priceRecords.isEmpty
            }
        )
        // SwiftData automatically optimizes relationship loading

        return (try? modelContext.fetch(descriptor)) ?? []
    }
}
```

### 7.2 Image Processing Optimization

```swift
// Optimized image handling
extension OCRService {
    private func preprocessImage(_ image: UIImage) -> UIImage? {
        // Resize image for optimal OCR processing
        let targetSize = CGSize(width: 1024, height: 1024)

        return image.resized(to: targetSize)?
                   .enhanced(contrast: 1.2, brightness: 0.1)
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
```

## 8. Privacy & Security

### 8.1 Data Privacy Implementation

```swift
// Privacy-focused data handling
class PrivacyManager {
    static let shared = PrivacyManager()

    // All data stays on device by default
    func configurePrivacySettings() {
        // Configure SwiftData for local-only storage
        // Set up CloudKit with user consent
        // Implement data export/deletion
    }

    func exportUserData() -> Data {
        // Export all user data as JSON
        let context = DataManager.shared.modelContext

        let receiptDescriptor = FetchDescriptor<Receipt>()
        let productDescriptor = FetchDescriptor<Product>()

        let receipts = try! context.fetch(receiptDescriptor)
        let products = try! context.fetch(productDescriptor)

        let exportData = ExportData(receipts: receipts, products: products)
        return try! JSONEncoder().encode(exportData)
    }

    func deleteAllUserData() async {
        // Complete data deletion for privacy compliance
        let context = DataManager.shared.modelContext

        // Delete all entities
        await context.perform {
            // Implementation
        }
    }
}
```

## 9. Deployment & App Store

### 9.1 App Store Optimization

**App Store Listing:**

- **Title**: "AllesTeurer - Receipt Price Tracker"
- **Subtitle**: "Track inflation with receipt scanning"
- **Keywords**: "receipt, price, tracker, inflation, shopping, OCR"
- **Category**: Finance or Shopping

**Screenshots Strategy:**

1. Receipt scanning in action
2. Price history charts
3. Analytics dashboard
4. Product comparison view
5. Privacy-focused features

### 9.2 Release Strategy

**Beta Testing:**

- Internal testing with TestFlight (2 weeks)
- External beta with 100 users (2 weeks)
- Feedback integration and bug fixes

**Phased Rollout:**

- Release to Germany first (primary market)
- Expand to Austria and Switzerland
- European Union rollout
- Global availability

## Conclusion

This iOS-first implementation plan provides a clear 12-week roadmap to deliver a privacy-focused, locally-intelligent receipt scanning and price tracking app. The architecture is designed to:

- **Start Simple**: iOS-only with local SwiftData storage
- **Deliver Value**: Core features work without backend dependencies
- **Scale Smart**: Easy evolution path to multi-platform with cloud services
- **Maintain Privacy**: All processing happens on-device initially
- **Ensure Quality**: Comprehensive testing and accessibility compliance

The app can launch in the App Store within 3 months, validate the market, and then expand with backend services and additional platforms based on user feedback and traction.
