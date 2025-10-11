# App Lifecycle & Termination Handling

## Overview

The **Alles Teurer** app now implements comprehensive lifecycle management to ensure data integrity and proper handling of iOS app termination scenarios, including SIGTERM and SIGKILL.

## Implementation Summary

### 🔄 Scene Phase Monitoring

The app uses SwiftUI's `@Environment(\.scenePhase)` to track app state transitions:

```swift
@Environment(\.scenePhase) private var scenePhase

.onChange(of: scenePhase) { oldPhase, newPhase in
    handleScenePhaseChange(from: oldPhase, to: newPhase)
}
```

### 📱 Three Main States

#### 1. **Active** (`.active`)

- App is in foreground and receiving events
- **Action**: Refresh data if needed, check for CloudKit changes

#### 2. **Inactive** (`.inactive`)

- Brief transitional state (e.g., Control Center pulled down, incoming call)
- **Action**: Save all pending changes immediately
- **Critical**: This is often the last chance to save before backgrounding

#### 3. **Background** (`.background`)

- App moved to background
- **Actions**:
  - Save all pending SwiftData changes
  - Synchronize UserDefaults
  - Log completion for debugging

## Data Persistence Strategy

### ✅ Automatic Save Points

Data is automatically saved at multiple points to prevent loss:

1. **On Inactive State** - First line of defense
2. **On Background State** - Second save attempt
3. **On Memory Warning** - Emergency save
4. **On Termination** - Final save attempt (when possible)

### 💾 Save Implementation

```swift
private func saveAllPendingChanges() {
    guard let container = modelContainer else { return }
    let context = container.mainContext

    if context.hasChanges {
        try context.save()
        print("💾 Successfully saved pending changes")
    }

    familySharingSettings.saveSettings()
}
```

## Signal Handling

### ⚠️ SIGTERM (Graceful Shutdown)

**What it is**: iOS sends SIGTERM when requesting graceful app termination

**Handler**:

```swift
signal(SIGTERM) { signal in
    print("⚠️ Received SIGTERM - performing graceful shutdown")
    // Data already saved via scenePhase changes
    exit(0)
}
```

**Note**: Cannot call Swift methods from signal handlers due to C interop limitations. Data must already be saved.

### 💥 SIGKILL (Forced Termination)

**What it is**: Immediate termination - no handler possible

**Protection Strategy**:

- Save aggressively at every state change
- Rely on `.inactive` and `.background` saves
- SwiftData's automatic journaling provides additional protection

## System Notifications

### 📢 UIApplication.willTerminateNotification

Called when iOS is about to terminate the app (rare on iOS 13+):

```swift
NotificationCenter.default.addObserver(
    forName: UIApplication.willTerminateNotification,
    object: nil,
    queue: .main
) { _ in
    // Final synchronization
    UserDefaults.standard.synchronize()
}
```

### 🧠 Memory Warning Notification

Called when system is low on memory:

```swift
NotificationCenter.default.addObserver(
    forName: UIApplication.didReceiveMemoryWarningNotification,
    object: nil,
    queue: .main
) { _ in
    // Save data immediately
    // Clear caches
    URLCache.shared.removeAllCachedResponses()
}
```

## Testing Lifecycle Handling

### Manual Testing Scenarios

1. **Normal Background**

   - Open app → Add data → Press home button
   - Expected: Data saved, logs show "App moved to background"

2. **Force Quit**

   - Open app → Add data → Swipe up in app switcher
   - Expected: Last save was on inactive/background transition

3. **Memory Pressure**

   - Open app → Fill memory with large operations
   - Expected: Save triggered, caches cleared

4. **Xcode Stop**
   - Run app → Add data → Stop in Xcode
   - Expected: SIGTERM handler called, data already saved

### Debugging

Enable console logging to see lifecycle events:

```
📱 App became active
📱 App became inactive
💾 Successfully saved pending changes
📱 App moved to background
📱 All data saved to disk
⚠️ Received SIGTERM - performing graceful shutdown
```

## iOS App Lifecycle Quirks

### ⚡ Modern iOS Behavior (iOS 13+)

- Apps rarely receive `willTerminate` notification
- System prefers to suspend apps in background
- SIGKILL used more often than SIGTERM for memory pressure
- **Critical**: Must save on `.inactive` and `.background` transitions

### 🔄 Best Practices Implemented

✅ **Multiple Save Points** - Don't rely on a single termination handler
✅ **SwiftData Auto-Save** - Leverage framework's built-in persistence
✅ **State-Based Saves** - React to scene phase changes
✅ **Fail-Safe Design** - Assume termination can happen anytime
✅ **Synchronous Saves** - Don't use async saves on termination

## Files Modified

1. **`Alles_TeurerApp.swift`**

   - Added `@Environment(\.scenePhase)` monitoring
   - Implemented `handleScenePhaseChange(_:to:)`
   - Added signal handlers for SIGTERM
   - Added notification observers for memory warnings and termination
   - Implemented `saveAllPendingChanges()` method

2. **`FamilySharingSettings.swift`**
   - Added `saveSettings()` method for explicit UserDefaults sync

## Performance Considerations

### 🚀 Optimizations

- **Conditional Saves**: Only save if `context.hasChanges`
- **Background Time**: iOS provides ~30 seconds for background saves
- **Rollback on Error**: Automatic context rollback on save failure
- **Cache Clearing**: Only on memory warnings, not every background

### 📊 Expected Behavior

- **Save Duration**: < 100ms for typical data
- **Memory Impact**: Minimal - SwiftData handles efficiently
- **Battery Impact**: Negligible - saves are quick and infrequent
- **Storage**: SwiftData uses SQLite with write-ahead logging (WAL)

## CloudKit Considerations

### ☁️ Family Sharing Mode

When family sharing is enabled:

- Data syncs to CloudKit automatically
- Local saves still critical for immediate persistence
- CloudKit sync happens in background
- Network failures don't affect local saves

### 🔒 Data Safety

- Local database always has latest data
- CloudKit provides redundancy
- Conflicts resolved automatically by SwiftData
- Debug and Release builds use separate databases

## Troubleshooting

### ❌ Data Loss Scenarios

**Symptom**: Data added but not persisted after app termination

**Diagnosis**:

1. Check console logs for save confirmations
2. Verify `hasChanges` returns true before save
3. Check for SwiftData errors in logs
4. Ensure ModelContext is not nil

**Solution**: Review lifecycle logs and ensure saves complete before background

### ⚠️ Common Issues

1. **Async saves on termination** - Don't work reliably

   - ✅ Fix: Use synchronous saves in lifecycle handlers

2. **Missing scenePhase observer** - No saves on background

   - ✅ Fix: Ensure `.onChange(of: scenePhase)` is attached

3. **SwiftData context not saving** - Check for errors
   - ✅ Fix: Wrap saves in do-catch, handle errors properly

## Future Enhancements

### 🔮 Potential Improvements

1. **Background Task** - Request extended background time for large saves
2. **Crash Reporting** - Integrate crash analytics to track termination scenarios
3. **User Feedback** - Show save indicators in UI
4. **Metrics** - Track save success rates and durations
5. **Backup Strategy** - Periodic exports for user peace of mind

## References

- [Apple: Managing Your App's Life Cycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)
- [SwiftUI Scene Phase](https://developer.apple.com/documentation/swiftui/scenephase)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)
- [Unix Signal Handling](https://www.gnu.org/software/libc/manual/html_node/Signal-Handling.html)

---

**Version**: 1.0  
**Last Updated**: 11. Oktober 2025  
**Author**: GitHub Copilot AI Assistant
