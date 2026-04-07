//
//  ProjectDetailView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

/// A navigation wrapper view that displays detailed project information.
///
/// ProjectDetailView serves as a navigation destination that presents comprehensive
/// project details through the JobDetailView component. It provides the navigation
/// context and title for the project detail screen.
///
/// Example usage:
/// ```
/// NavigationStack {
///     ProjectListView(...)
///     .navigationDestination(for: Project.self) { project in
///         ProjectDetailView(project: project)
///     }
/// }
/// ```
struct ProjectDetailView: View {
    // MARK: - Properties

    /// The project to display detailed information for
    let project: Project

    // MARK: - Constants

    /// Navigation title for the detail view
    private let navigationTitle = "Service Detail"

    /// Navigation bar display mode
    private let navigationBarDisplayMode: NavigationBarItem.TitleDisplayMode = .inline

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            /// Main content view displaying project details
            JobDetailView(project: project)
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(navigationBarDisplayMode)
    }
}
