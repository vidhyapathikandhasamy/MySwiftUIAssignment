//
//  ListView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//
import SwiftUI

struct ProjectListView: View {
    let projects: [Project]
    
    var onSelect: (Project) -> Void
    
    var body: some View {
        List(projects) { project in
            Button {
                onSelect(project)
            } label: {
                ProjectCardView(project: project)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.plain)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color(.white))
        .padding()
    }
}
