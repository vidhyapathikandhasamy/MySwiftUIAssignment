//
//  ProjectListView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

/// A list view component that displays projects in a scrollable list with refresh capability.
///
/// ProjectListView renders a collection of projects as interactive cards with:
/// - Pull-to-refresh functionality using async/await
/// - Selection handling through callback closure
/// - Custom styling for a clean, modern appearance
/// - Hidden scroll indicators and dividers for minimal UI
///
/// Example usage:
/// ```
/// ProjectListView(
///     projects: projects,
///     onSelect: { selectedProject in
///         // Handle project selection
///     },
///     onRefresh: { await viewModel.refreshProjects() }
/// )
/// ```
struct ProjectListView: View {
    // MARK: - Properties
    
    /// Array of projects to display in the list
    let projects: [Project]
    
    /// Closure called when a project is selected
    var onSelect: (Project) -> Void
    
    /// Async closure called when the user performs pull-to-refresh
    var onRefresh: () async -> Void
    
    // MARK: - Constants
    
    /// Vertical padding for each row
    private let rowVerticalPadding: CGFloat = 8
    
    /// Horizontal padding for the entire list
    private let horizontalPadding: CGFloat = 16
    
    // MARK: - Body
    
    var body: some View {
        List(projects) { project in
            projectRow(project)
        }
        .listStyle(.plain)
        .listConfiguration
        .background(Color.white)
        .padding(.horizontal, horizontalPadding)
        .refreshable {
            await onRefresh()
        }
    }
    
    // MARK: - Subviews
    
    /// Creates a single row for a project with selection handling.
    ///
    /// - Parameter project: The project to display in the row
    /// - Returns: A view representing the project row with button styling
    @ViewBuilder
    private func projectRow(_ project: Project) -> some View {
        Button {
            onSelect(project)
        } label: {
            ProjectCardView(project: project)
                .padding(.vertical, rowVerticalPadding)
        }
        .buttonStyle(.plain)
        .listRowConfiguration
    }
}

// MARK: - List Styling Extensions

/// Extension to apply consistent list row configuration
private extension View {
    /// Applies standard list row styling (no insets, separators, or background)
    var listRowConfiguration: some View {
        self
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
    
    /// Applies consistent list styling (plain style with hidden scroll indicators)
    var listConfiguration: some View {
        self
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
    }
}

// MARK: - Preview

#Preview("Default List") {
    let mockProjects = [
        Project(
            title: "Office Space Revamp",
            company: "XYZ Industries",
            description: "Transform your office with sleek, contemporary furnishings.",
            status: .planned,
            time: Date(),
            indicatorColor: .planningColor,
            latitude: 37.7749,
            longitude: -122.4194
        ),
        Project(
            title: "Modern Workspace Makeover",
            company: "Acme Corp",
            description: "Revitalize your workspace with stylish, modern decor.",
            status: .scheduled,
            time: Date().addingTimeInterval(86400),
            indicatorColor: .scheduledColor,
            latitude: 34.0522,
            longitude: -118.2437
        ),
        Project(
            title: "Contemporary Office Transformation",
            company: "Beta Solutions",
            description: "Elevate your office environment with chic, innovative designs.",
            status: .confirmed,
            time: Date().addingTimeInterval(-86400),
            indicatorColor: .approvedColor,
            latitude: 40.7128,
            longitude: -74.0060
        )
    ]
    
    ProjectListView(
        projects: mockProjects,
        onSelect: { _ in },
        onRefresh: { }
    )
}

