//
//  ProjectDetails.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct ProjectDetailView: View {
    
    let project: Project
    
    var body: some View {
        VStack {
            JobDetailView()
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProjectDetailView(project: Project(
        title: "Contemporary Office Transformation",
        company: "Beta Solutions",
        description: "Elevate your office environment with chic, innovative designs.",
        status: .confirmed,
        time: "Today, 4:00 PM",
        indicatorColor: .blue
    ))
}





// MARK: - Preview

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailView()
    }
}
