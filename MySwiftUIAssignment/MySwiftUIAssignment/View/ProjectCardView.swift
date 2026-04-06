//
//  CardView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct ProjectCardView: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Title + Indicator
            HStack {
                Text(project.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Circle()
                    .fill(project.indicatorColor)
                    .frame(width: 10, height: 10)
            }
            
            // Company
            HStack(spacing: 8) {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(.blue)
                
                Text(project.company)
                    .foregroundColor(.gray)
            }
            
            // Description
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "doc.text")
                    .foregroundColor(.blue)
                
                Text(project.description)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            // Bottom Row
            HStack {
                // Status Badge
                HStack(spacing: 6) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(project.status.textColor.opacity(0.3))
                        .frame(width: 16, height: 16)
                    
                    Text(project.status.title)
                        .foregroundColor(project.status.textColor)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(project.status.color)
                .cornerRadius(20)
                
                Spacer()
                
                Text(project.time)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(16)
    }
}
