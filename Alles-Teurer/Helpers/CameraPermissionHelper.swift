//
//  CameraPermissionHelper.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 03.11.25.
//

#if canImport(UIKit)
import UIKit
import AVFoundation
import Combine

/// Helper for managing camera permissions on iOS
@MainActor
class CameraPermissionHelper: ObservableObject {
    @Published var permissionStatus: AVAuthorizationStatus = .notDetermined
    @Published var showingPermissionDeniedAlert = false
    
    init() {
        checkPermissionStatus()
    }
    
    /// Check current camera permission status
    func checkPermissionStatus() {
        permissionStatus = AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    /// Request camera permission
    func requestPermission() async -> Bool {
        // If already determined, don't request again
        if permissionStatus != .notDetermined {
            return permissionStatus == .authorized
        }
        
        // Request permission
        let granted = await AVCaptureDevice.requestAccess(for: .video)
        
        // Update status on main thread
        await MainActor.run {
            checkPermissionStatus()
        }
        
        return granted
    }
    
    /// Check if camera is available and authorized
    var isCameraAvailable: Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    /// Check if we can use the camera right now
    var canUseCamera: Bool {
        return isCameraAvailable && permissionStatus == .authorized
    }
    
    /// Open iOS Settings app to the app's settings page
    func openSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL)
        }
    }
    
    /// Get user-friendly description of permission status
    var statusDescription: String {
        switch permissionStatus {
        case .authorized:
            return "Kamerazugriff erlaubt"
        case .denied:
            return "Kamerazugriff verweigert"
        case .restricted:
            return "Kamerazugriff eingeschränkt"
        case .notDetermined:
            return "Kamerazugriff nicht festgelegt"
        @unknown default:
            return "Unbekannter Status"
        }
    }
}
#endif
