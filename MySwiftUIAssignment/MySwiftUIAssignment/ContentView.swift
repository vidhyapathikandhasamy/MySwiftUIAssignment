//
//  ContentView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                ProjectHeaderView(searchText: $viewModel.searchText, titleText: "Services", showSearchBar: true)
                    .padding(.bottom, 8)
                PixelDivider()
                ProjectListView(projects: viewModel.filteredProjects, onSelect: { project in
                    path.append(project)
                }, onRefresh: {
                    await viewModel.refreshProjects()
                })
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


