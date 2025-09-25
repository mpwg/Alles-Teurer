# AllesTeurer - Infrastructure & CI/CD

## Development Environment

### Required Tools

- **Xcode 26.0+** - Primary IDE with Swift 6 support
- **iOS 26 SDK** - Latest SDK for Visual Intelligence APIs
- **Swift 6.0** - With strict concurrency checking
- **Fastlane** - MANDATORY for all build operations

### Build Configuration

```ruby
# Fastfile
platform :ios do
  desc "Build with iOS 26 SDK"
  lane :build do
    xcodebuild(
      scheme: "AllesTeurer",
      sdk: "iphoneos26.0",
      configuration: "Release",
      swift_version: "6.0",
      other_swift_flags: "-strict-concurrency=complete"
    )
  end

  desc "Run Swift Testing suite"
  lane :test do
    scan(
      scheme: "AllesTeurer",
      devices: ["iPhone 16 Pro"],
      sdk: "iphonesimulator26.0",
      test_framework: "swift_testing"
    )
  end
end
```

### MANDATORY: Never Use Direct xcodebuild

```bash
# ✅ CORRECT - Always use Fastlane
bundle exec fastlane build
bundle exec fastlane test

# ❌ WRONG - Never use directly
xcodebuild build -scheme "AllesTeurer"  # PROHIBITED
```

## CI/CD Pipeline

### GitHub Actions Configuration

```yaml
name: iOS 26 CI/CD

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  build-and-test:
    runs-on: macos-14

    steps:
      - uses: actions/checkout@v4

      - name: Select Xcode 26
        run: sudo xcode-select -s /Applications/Xcode_26.app

      - name: Install dependencies
        run: bundle install

      - name: Build with Fastlane
        run: bundle exec fastlane build

      - name: Run Swift Testing
        run: bundle exec fastlane test

      - name: Check Swift 6 Concurrency
        run: |
          swift build -Xswiftc -strict-concurrency=complete
```
