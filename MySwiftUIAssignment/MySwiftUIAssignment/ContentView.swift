//
//  ContentView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                ProjectHeaderView(titleText: "Services", showSearchBar: true)
                    .padding(.bottom, 8)
                PixelDivider()
                ProjectListView { project in
                    path.append(project)
                }
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


