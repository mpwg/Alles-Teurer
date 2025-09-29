//
//  ToolbarAction.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 29.09.25.
//

import Foundation
import SwiftUI

/// Represents a toolbar action with its configuration and behavior
enum ToolbarAction: Identifiable {
    case save
    case cancel
    case delete
    case export
    case add
    case scan
    case reset
    case done
    case testData
    case deleteAll
    case sort(SortOption)
    case custom(id: String, title: String, systemImage: String, action: () async -> Void)
    
    var id: String {
        switch self {
        case .save: return "save"
        case .cancel: return "cancel"
        case .delete: return "delete"
        case .export: return "export"
        case .add: return "add"
        case .scan: return "scan"
        case .reset: return "reset"
        case .done: return "done"
        case .testData: return "testData"
        case .deleteAll: return "deleteAll"
        case .sort(let option): return "sort_\(option.rawValue)"
        case .custom(let id, _, _, _): return id
        }
    }
    
    var title: String {
        switch self {
        case .save: return "Speichern"
        case .cancel: return "Abbrechen"
        case .delete: return "Löschen"
        case .export: return "CSV Export"
        case .add: return "Hinzufügen"
        case .scan: return "Rechnung scannen"
        case .reset: return "Zurücksetzen"
        case .done: return "Fertig"
        case .testData: return "Testdaten"
        case .deleteAll: return "Alle löschen"
        case .sort(_): return "Sortieren"
        case .custom(_, let title, _, _): return title
        }
    }
    
    var systemImage: String {
        switch self {
        case .save: return "checkmark"
        case .cancel: return "xmark"
        case .delete: return "trash"
        case .export: return "square.and.arrow.up"
        case .add: return "plus"
        case .scan: return "qrcode.viewfinder"
        case .reset: return "arrow.counterclockwise"
        case .done: return "checkmark.circle"
        case .testData: return "testtube.2"
        case .deleteAll: return "trash.fill"
        case .sort(_): return "arrow.up.arrow.down"
        case .custom(_, _, let systemImage, _): return systemImage
        }
    }
    
    var role: ButtonRole? {
        switch self {
        case .delete, .deleteAll: return .destructive
        case .cancel: return .cancel
        default: return nil
        }
    }
    
    var accessibilityLabel: String {
        switch self {
        case .save: return "Änderungen speichern"
        case .cancel: return "Vorgang abbrechen"
        case .delete: return "Eintrag löschen"
        case .export: return "Daten als CSV exportieren"
        case .add: return "Neuen Eintrag hinzufügen"
        case .scan: return "Rechnung mit Kamera scannen"
        case .reset: return "Eingaben zurücksetzen"
        case .done: return "Fertig"
        case .testData: return "Testdaten generieren"
        case .deleteAll: return "Alle Einträge löschen"
        case .sort(_): return "Sortieroptionen"
        case .custom(_, let title, _, _): return title
        }
    }
    
    var accessibilityHint: String? {
        switch self {
        case .save: return "Speichert die aktuellen Änderungen"
        case .cancel: return "Bricht den aktuellen Vorgang ab"
        case .delete: return "Löscht den ausgewählten Eintrag unwiderruflich"
        case .export: return "Exportiert alle Daten in eine CSV-Datei"
        case .add: return "Öffnet das Formular zum Hinzufügen eines neuen Eintrags"
        case .scan: return "Öffnet die Kamera zum Scannen einer Rechnung"
        case .reset: return "Setzt alle Eingaben auf den ursprünglichen Zustand zurück"
        case .done: return "Schließt die aktuelle Ansicht"
        case .testData: return "Generiert Beispieldaten für Testzwecke"
        case .deleteAll: return "Löscht alle gespeicherten Einträge unwiderruflich"
        case .sort(_): return "Ändert die Sortierung und Reihenfolge der Einträge"
        case .custom(_, _, _, _): return nil
        }
    }
}

/// Configuration for toolbar placement and styling
struct ToolbarActionConfiguration {
    let action: ToolbarAction
    let placement: ToolbarItemPlacement
    let isEnabled: Bool
    let isVisible: Bool
    
    init(action: ToolbarAction, placement: ToolbarItemPlacement = .primaryAction, isEnabled: Bool = true, isVisible: Bool = true) {
        self.action = action
        self.placement = placement
        self.isEnabled = isEnabled
        self.isVisible = isVisible
    }
}

/// Comprehensive toolbar configuration for a view
struct ToolbarConfiguration {
    let actions: [ToolbarActionConfiguration]
    
    init(actions: [ToolbarActionConfiguration]) {
        self.actions = actions
    }
    
    /// Helper to create configuration with simple primary actions
    static func primary(_ actions: [ToolbarAction]) -> ToolbarConfiguration {
        ToolbarConfiguration(actions: actions.map { ToolbarActionConfiguration(action: $0) })
    }
    
    /// Helper to create configuration with mixed placements
    static func mixed(_ configurations: [ToolbarActionConfiguration]) -> ToolbarConfiguration {
        ToolbarConfiguration(actions: configurations)
    }
    
    /// Get actions for a specific placement
    func actions(for placement: ToolbarItemPlacement) -> [ToolbarActionConfiguration] {
        actions.filter { config in
            config.isVisible && isPlacementMatch(config.placement, placement)
        }
    }
    
    /// Helper function to compare ToolbarItemPlacement values
    private func isPlacementMatch(_ configPlacement: ToolbarItemPlacement, _ targetPlacement: ToolbarItemPlacement) -> Bool {
        // Compare by description since ToolbarItemPlacement doesn't conform to Equatable
        String(describing: configPlacement) == String(describing: targetPlacement)
    }
}