//
//  ProjectDetails.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI
import MapKit

struct ProjectDetailView: View {
    
    let project: Project
    
    var body: some View {
        VStack {
            JobDetailView()
        }
        .navigationTitle("Service Detail") // 👈 important
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

struct JobDetailView: View {
    
    // MARK: - Mock Data
    let title = "Office Space Revamp"
    let customer = "XYZ Industries"
    let description = "Transform your office with sleek, contemporary furnishings."
    let scheduledTime = "Today, 3:00 PM"
    let locationText = "Maple Avenue, Seattle, WA 98101"
    let notes = "Ensure all old furniture is removed prior to installation. Coordinate with on-site manager for access and layout adjustments."
    
    // Map region
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // MARK: - Map
                    Map(coordinateRegion: $region)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal)
                    
                    // MARK: - Header
                    HStack {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        StatusBadge(text: "Planned")
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Sections
                    VStack(spacing: 20) {
                        
                        InfoRow(
                            icon: "person.circle",
                            title: "Customer",
                            value: customer
                        )
                        
                        InfoRow(
                            icon: "doc.text",
                            title: "Description",
                            value: description
                        )
                        
                        InfoRow(
                            icon: "clock",
                            title: "Scheduled Time",
                            value: scheduledTime
                        )
                        
                        Button(action: openMaps) {
                            InfoRow(
                                icon: "location",
                                title: "Location",
                                value: locationText
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        InfoRow(
                            icon: "message",
                            title: "Service Notes",
                            value: notes
                        )
                    }
                    .padding()
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                    
                }
                .padding(.top)
            }
        }
        .background(Color(.white))
    }
    
    // MARK: - Actions
    
    func openMaps() {
        print("Open Maps tapped")
    }
    
    func startJob() {
        print("Start Job tapped")
    }
    
    func contactCustomer() {
        print("Call Customer tapped")
    }
}

// MARK: - Reusable Components

struct InfoRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.iconColor)
                .frame(width: 28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
    }
}

struct StatusBadge: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.blue.opacity(0.15))
            .foregroundColor(.blue)
            .clipShape(Capsule())
    }
}



// MARK: - Preview

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailView()
    }
}
