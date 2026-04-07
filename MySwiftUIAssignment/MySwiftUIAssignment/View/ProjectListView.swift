//
//  ListView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//
import SwiftUI

struct ProjectListView: View {
    let projects: [Project] = [
        Project(
            title: "Office Space Revamp",
            company: "XYZ Industries",
            description: "Transform your office with sleek, contemporary furnishings.",
            status: .planned,
            time: "Today, 3:00 PM",
            indicatorColor: .planningColor
        ),
        Project(
            title: "Modern Workspace Makeover",
            company: "Acme Corp",
            description: "Revitalize your workspace with stylish, modern decor that inspires creativity.",
            status: .scheduled,
            time: "Today, 3:30 PM",
            indicatorColor: .scheduledColor
        ),
        Project(
            title: "Contemporary Office Transformation",
            company: "Beta Solutions",
            description: "Elevate your office environment with chic, innovative designs.",
            status: .confirmed,
            time: "Today, 4:00 PM",
            indicatorColor: .approvedColor
        ),
        Project(
            title: "Office Space Revamp",
            company: "XYZ Industries",
            description: "Transform your office with sleek, contemporary furnishings.",
            status: .planned,
            time: "Today, 3:00 PM",
            indicatorColor: .planningColor
        ),
        Project(
            title: "Modern Workspace Makeover",
            company: "Acme Corp",
            description: "Revitalize your workspace with stylish, modern decor that inspires creativity.",
            status: .scheduled,
            time: "Today, 3:30 PM",
            indicatorColor: .scheduledColor
        ),
        Project(
            title: "Contemporary Office Transformation",
            company: "Beta Solutions",
            description: "Elevate your office environment with chic, innovative designs.",
            status: .confirmed,
            time: "Today, 4:00 PM",
            indicatorColor: .approvedColor
        )
    ]
    
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
