//
//  ToolbarViewModelProtocol.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 29.09.25.
//

import Foundation
import SwiftUI

/// Protocol for ViewModels that need to provide toolbar configuration and handle toolbar actions
@MainActor
protocol ToolbarViewModelProtocol: AnyObject {
    /// Current toolbar configuration for the view
    var toolbarConfiguration: ToolbarConfiguration { get }
    
    /// Handle a toolbar action
    /// - Parameter action: The toolbar action to handle
    func handleToolbarAction(_ action: ToolbarAction) async
    
    /// Check if a specific action is currently enabled
    /// - Parameter action: The action to check
    /// - Returns: True if the action should be enabled
    func isActionEnabled(_ action: ToolbarAction) -> Bool
    
    /// Check if a specific action should be visible
    /// - Parameter action: The action to check  
    /// - Returns: True if the action should be visible
    func isActionVisible(_ action: ToolbarAction) -> Bool
}

/// Default implementations for common behaviors
extension ToolbarViewModelProtocol {
    func isActionEnabled(_ action: ToolbarAction) -> Bool {
        // Default: all actions are enabled unless overridden
        return true
    }
    
    func isActionVisible(_ action: ToolbarAction) -> Bool {
        // Default: all actions are visible unless overridden
        return true
    }
    
    /// Helper to create a toolbar configuration with dynamic enabled/visible states
    func createConfiguration(actions: [ToolbarAction], placement: ToolbarItemPlacement = .primaryAction) -> ToolbarConfiguration {
        let configurations = actions.map { action in
            ToolbarActionConfiguration(
                action: action,
                placement: placement,
                isEnabled: isActionEnabled(action),
                isVisible: isActionVisible(action)
            )
        }
        return ToolbarConfiguration(actions: configurations)
    }
    
    /// Helper to create mixed toolbar configuration with different placements
    func createMixedConfiguration(_ actionPlacements: [(ToolbarAction, ToolbarItemPlacement)]) -> ToolbarConfiguration {
        let configurations = actionPlacements.map { (action, placement) in
            ToolbarActionConfiguration(
                action: action,
                placement: placement,
                isEnabled: isActionEnabled(action),
                isVisible: isActionVisible(action)
            )
        }
        return ToolbarConfiguration(actions: configurations)
    }
}

/// Specialized protocol for ViewModels that handle form-based toolbars (save/cancel pattern)
@MainActor
protocol FormToolbarViewModelProtocol: ToolbarViewModelProtocol {
    /// Whether the form is valid and can be saved
    var isFormValid: Bool { get }
    
    /// Whether the form is currently loading/processing
    var isLoading: Bool { get }
    
    /// Save the current form data
    func save() async -> Bool
    
    /// Cancel/dismiss the current form
    func cancel()
}

extension FormToolbarViewModelProtocol {
    func isActionEnabled(_ action: ToolbarAction) -> Bool {
        switch action {
        case .save:
            return isFormValid && !isLoading
        case .cancel:
            return !isLoading
        default:
            return true
        }
    }
    
    var toolbarConfiguration: ToolbarConfiguration {
        createMixedConfiguration([
            (.cancel, .cancellationAction),
            (.save, .primaryAction)
        ])
    }
    
    func handleToolbarAction(_ action: ToolbarAction) async {
        switch action {
        case .save:
            _ = await save()
        case .cancel:
            cancel()
        default:
            break
        }
    }
}

/// Specialized protocol for ViewModels that handle list-based toolbars (add/export/delete pattern)
@MainActor  
protocol ListToolbarViewModelProtocol: ToolbarViewModelProtocol {
    /// Whether there are items in the list
    var hasItems: Bool { get }
    
    /// Add a new item
    func addItem() async
    
    /// Scan a receipt
    func scanReceipt() async
    
    /// Export data
    func exportData() async
    
    /// Delete all items
    func deleteAllItems() async
}

extension ListToolbarViewModelProtocol {
    func isActionVisible(_ action: ToolbarAction) -> Bool {
        switch action {
        case .export, .deleteAll:
            return hasItems
        case .testData:
            #if DEBUG
            return true
            #else
            return false
            #endif
        default:
            return true
        }
    }
    
    var toolbarConfiguration: ToolbarConfiguration {
        let primaryActions: [ToolbarAction] = [.scan, .add] + (hasItems ? [.export] : []) + [.testData].filter { isActionVisible($0) }
        let secondaryActions: [ToolbarAction] = hasItems ? [.deleteAll] : []
        
        var configurations: [ToolbarActionConfiguration] = []
        
        configurations.append(contentsOf: primaryActions.map { 
            ToolbarActionConfiguration(action: $0, placement: .primaryAction, isVisible: isActionVisible($0))
        })
        
        configurations.append(contentsOf: secondaryActions.map {
            ToolbarActionConfiguration(action: $0, placement: .secondaryAction, isVisible: isActionVisible($0))
        })
        
        return ToolbarConfiguration(actions: configurations)
    }
    
    func handleToolbarAction(_ action: ToolbarAction) async {
        switch action {
        case .add:
            await addItem()
        case .scan:
            await scanReceipt()
        case .export:
            await exportData()
        case .deleteAll:
            await deleteAllItems()
        case .testData:
            #if DEBUG
            await addItem() // Override this in implementation for actual test data
            #endif
        default:
            break
        }
    }
}