//
//  StandardToolbar.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 29.09.25.
//

import SwiftUI
import Combine

/// A standardized toolbar component that works with ToolbarViewModelProtocol
struct StandardToolbar<ViewModel: ToolbarViewModelProtocol>: ToolbarContent {
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some ToolbarContent {
        // Primary Actions (right side on iOS, main area on other platforms)
        let primaryActions = viewModel.toolbarConfiguration.actions(for: .primaryAction)
        if !primaryActions.isEmpty {
            ToolbarItemGroup(placement: .primaryAction) {
                ForEach(primaryActions, id: \.action.id) { config in
                    ToolbarButton(configuration: config) { action in
                        Task {
                            await viewModel.handleToolbarAction(action)
                        }
                    }
                }
            }
        }
        
        // Secondary Actions (usually destructive actions)
        let secondaryActions = viewModel.toolbarConfiguration.actions(for: .secondaryAction)
        if !secondaryActions.isEmpty {
            ToolbarItemGroup(placement: .secondaryAction) {
                ForEach(secondaryActions, id: \.action.id) { config in
                    ToolbarButton(configuration: config) { action in
                        Task {
                            await viewModel.handleToolbarAction(action)
                        }
                    }
                }
            }
        }
        
        // Cancellation Actions (left side on iOS)
        let cancellationActions = viewModel.toolbarConfiguration.actions(for: .cancellationAction)
        if !cancellationActions.isEmpty {
            ToolbarItemGroup(placement: .cancellationAction) {
                ForEach(cancellationActions, id: \.action.id) { config in
                    ToolbarButton(configuration: config) { action in
                        Task {
                            await viewModel.handleToolbarAction(action)
                        }
                    }
                }
            }
        }
        
        // Top Bar Leading (for navigation-style layouts)
        let topBarLeadingActions = viewModel.toolbarConfiguration.actions(for: .topBarLeading)
        if !topBarLeadingActions.isEmpty {
            ToolbarItemGroup(placement: .topBarLeading) {
                ForEach(topBarLeadingActions, id: \.action.id) { config in
                    ToolbarButton(configuration: config) { action in
                        Task {
                            await viewModel.handleToolbarAction(action)
                        }
                    }
                }
            }
        }
        
        // Top Bar Trailing (for navigation-style layouts)
        let topBarTrailingActions = viewModel.toolbarConfiguration.actions(for: .topBarTrailing)
        if !topBarTrailingActions.isEmpty {
            ToolbarItemGroup(placement: .topBarTrailing) {
                ForEach(topBarTrailingActions, id: \.action.id) { config in
                    ToolbarButton(configuration: config) { action in
                        Task {
                            await viewModel.handleToolbarAction(action)
                        }
                    }
                }
            }
        }
    }
}

/// A standardized toolbar button with proper accessibility and styling
private struct ToolbarButton: View {
    let configuration: ToolbarActionConfiguration
    let onAction: (ToolbarAction) -> Void
    
    init(configuration: ToolbarActionConfiguration, onAction: @escaping (ToolbarAction) -> Void) {
        self.configuration = configuration
        self.onAction = onAction
    }
    
    var body: some View {
        Button {
            onAction(configuration.action)
        } label: {
            Label(configuration.action.title, systemImage: configuration.action.systemImage)
        }
        .disabled(!configuration.isEnabled)
        .accessibilityLabel(configuration.action.accessibilityLabel)
        .accessibilityHint(configuration.action.accessibilityHint ?? "")
        .buttonStyle(toolbarButtonStyle)
    }
    
    private var toolbarButtonStyle: AnyButtonStyle {
        switch configuration.action.role {
        case .destructive:
            return AnyButtonStyle(DestructiveToolbarButtonStyle())
        default:
            return AnyButtonStyle(DefaultToolbarButtonStyle())
        }
    }
}

/// Type-erased ButtonStyle wrapper
private struct AnyButtonStyle: ButtonStyle {
    private let _makeBody: (Configuration) -> AnyView
    
    init<S: ButtonStyle>(_ style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}

/// Style for standard toolbar buttons
private struct DefaultToolbarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

/// Style for destructive toolbar buttons (red tint)
private struct DestructiveToolbarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.red)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

/// Convenience extension for Views to easily add StandardToolbar
extension View {
    /// Add a standardized toolbar using a ToolbarViewModelProtocol
    func standardToolbar<ViewModel: ToolbarViewModelProtocol>(_ viewModel: ViewModel) -> some View {
        self.toolbar {
            StandardToolbar(viewModel: viewModel)
        }
    }
}

/// Specialized toolbar for sort actions with Menu support
struct SortToolbar<ViewModel: ToolbarViewModelProtocol>: ToolbarContent {
    let viewModel: ViewModel
    let sortOption: Binding<SortOption>
    let sortOrder: Binding<SortOrder>
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Menu {
                Picker("Sortierung", selection: sortOption) {
                    Label("Preis", systemImage: "eurosign.circle")
                        .tag(SortOption.price)
                    Label("Datum", systemImage: "calendar")
                        .tag(SortOption.date)
                    Label("Geschäft", systemImage: "storefront")
                        .tag(SortOption.shop)
                }
                .pickerStyle(.inline)
                
                Divider()
                
                Picker("Reihenfolge", selection: sortOrder) {
                    Label("Aufsteigend", systemImage: "arrow.up")
                        .tag(SortOrder.forward)
                    Label("Absteigend", systemImage: "arrow.down")
                        .tag(SortOrder.reverse)
                }
                .pickerStyle(.inline)
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .accessibilityLabel("Sortieroptionen")
                    .accessibilityHint("Sortierung und Reihenfolge der Einträge ändern")
            }
        }
    }
}

#if DEBUG
struct StandardToolbar_Previews: PreviewProvider {
    @MainActor
    @Observable
    class MockViewModel: ToolbarViewModelProtocol {        
        var toolbarConfiguration: ToolbarConfiguration {
            ToolbarConfiguration.primary([.save, .cancel, .delete])
        }
        
        func handleToolbarAction(_ action: ToolbarAction) async {
            print("Mock action: \(action)")
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Text("Preview Content")
                .toolbar {
                    StandardToolbar(viewModel: MockViewModel())
                }
        }
    }
}
#endif