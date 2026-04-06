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
            indicatorColor: .green
        ),
        Project(
            title: "Modern Workspace Makeover",
            company: "Acme Corp",
            description: "Revitalize your workspace with stylish, modern decor that inspires creativity.",
            status: .scheduled,
            time: "Today, 3:30 PM",
            indicatorColor: .yellow
        ),
        Project(
            title: "Contemporary Office Transformation",
            company: "Beta Solutions",
            description: "Elevate your office environment with chic, innovative designs.",
            status: .confirmed,
            time: "Today, 4:00 PM",
            indicatorColor: .blue
        ),
        Project(
            title: "Office Space Revamp",
            company: "XYZ Industries",
            description: "Transform your office with sleek, contemporary furnishings.",
            status: .planned,
            time: "Today, 3:00 PM",
            indicatorColor: .green
        ),
        Project(
            title: "Modern Workspace Makeover",
            company: "Acme Corp",
            description: "Revitalize your workspace with stylish, modern decor that inspires creativity.",
            status: .scheduled,
            time: "Today, 3:30 PM",
            indicatorColor: .yellow
        ),
        Project(
            title: "Contemporary Office Transformation",
            company: "Beta Solutions",
            description: "Elevate your office environment with chic, innovative designs.",
            status: .confirmed,
            time: "Today, 4:00 PM",
            indicatorColor: .blue
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(projects) { project in
                    ProjectCardView(project: project)
                }
            }
            .padding()
        }
        .background(Color(.white))
    }
}
