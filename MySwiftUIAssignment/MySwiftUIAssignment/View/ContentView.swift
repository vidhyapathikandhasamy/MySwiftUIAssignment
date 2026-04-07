//
//  ContentView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

/// Root view of the application that manages the main navigation flow.
///
/// ContentView serves as the entry point for the app's UI hierarchy, handling:
/// - Navigation stack for hierarchical view transitions
/// - Search functionality integration through the view model
/// - Project list display and project detail navigation
struct ContentView: View {
    // MARK: - State Properties
    
    /// Manages the navigation stack for push/pop operations
    @State private var path = NavigationPath()
    
    /// View model managing search state, filtering, and data operations
    @StateObject private var viewModel = SearchViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                // MARK: - Header Section
                
                /// App header with integrated search bar
                ProjectHeaderView(
                    searchText: $viewModel.searchText,
                    titleText: "Services",
                    showSearchBar: true
                )
                
                /// Visual separator between header and content
                PixelDivider()
                    .padding(.top, 12)
                
                // MARK: - Content Section
                
                /// Main project list view with pull-to-refresh and selection handling
                ProjectListView(
                    projects: viewModel.filteredProjects,
                    onSelect: { path.append($0) },
                    onRefresh: { await viewModel.refreshProjects() }
                )
                /// Navigation destination for project detail view
                .navigationDestination(for: Project.self) { project in
                    ProjectDetailView(project: project)
                }
            }
        }
    }
}



#Preview {
    ContentView()
}


