# AllesTeurer - Requirements Specification

## Technical Requirements

### Platform Requirements (MANDATORY)

- **WHEN** the app is installed, **THE SYSTEM SHALL** require iOS 26.0 or later
- **WHEN** building the app, **THE SYSTEM SHALL** use Xcode 26 with Swift 6
- **WHEN** processing receipts, **THE SYSTEM SHALL** use Vision Framework 5.0 with Visual Intelligence APIs
- **WHEN** storing data, **THE SYSTEM SHALL** use SwiftData 2.0 with actor isolation
- **WHEN** displaying charts, **THE SYSTEM SHALL** use Swift Charts 2.0

### Concurrency Requirements (CRITICAL - NO EXCEPTIONS)

- **WHEN** performing async operations, **THE SYSTEM SHALL** always use async/await
- **WHEN** accessing data, **THE SYSTEM SHALL** use @ModelActor for thread safety
- **WHEN** updating UI, **THE SYSTEM SHALL** use @MainActor
- **WHEN** creating ViewModels, **THE SYSTEM SHALL** use @Observable (NEVER ObservableObject)
- **IF** legacy code uses completion handlers, **THEN THE SYSTEM SHALL** refactor to async/await

### Visual Intelligence Requirements

- **WHEN** scanning a receipt, **THE SYSTEM SHALL** use iOS 26 Visual Intelligence for universal recognition
- **WHEN** processing images, **THE SYSTEM SHALL** utilize the Neural Engine on A18 Pro chips
- **WHEN** learning from corrections, **THE SYSTEM SHALL** use on-device ML with differential privacy
- **WHEN** confidence is below 85%, **THE SYSTEM SHALL** request user verification
- **WHEN** processing receipts, **THE SYSTEM SHALL** complete within 1.5 seconds on iPhone 16 Pro

### Testing Requirements

- **WHEN** writing tests, **THE SYSTEM SHALL** use Swift Testing framework (@Test, #expect)
- **WHEN** testing async code, **THE SYSTEM SHALL** use async test methods
- **WHEN** testing UI, **THE SYSTEM SHALL** use iOS 26 XCUITest
- **WHEN** measuring performance, **THE SYSTEM SHALL** use Xcode 26 Instruments
