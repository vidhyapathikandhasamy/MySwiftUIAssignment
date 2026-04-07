//
//  JobDetailView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 07/04/26.
//
import SwiftUI
import MapKit

private struct MapPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct JobDetailView: View {
    
    let project: Project
    
    private let locationCoordinate = CLLocationCoordinate2D(latitude: 12.977723304991823, longitude: 80.2515434176114)
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 12.977723304991823, longitude: 80.2515434176114),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // MARK: - Map
                    Map(coordinateRegion: $region, annotationItems: [MapPin(coordinate: locationCoordinate)]) { pin in
                        MapMarker(coordinate: pin.coordinate, tint: .red)
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                    
                    // MARK: - Header
                    HStack {
                        Text(project.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        StatusBadge(text: project.status.title)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Sections
                    VStack(spacing: 20) {
                        
                        InfoRow(
                            icon: "person.circle",
                            title: "Customer",
                            value: project.company
                        )
                        
                        InfoRow(
                            icon: "doc.text",
                            title: "Description",
                            value: project.description
                        )
                        
                        InfoRow(
                            icon: "clock",
                            title: "Scheduled Time",
                            value: project.formattedTime
                        )
                        
                        Button(action: openMaps) {
                            InfoRow(
                                icon: "location",
                                title: "Location",
                                value: "Coordinate: 12.977723304991823, 80.2515434176114"
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        InfoRow(
                            icon: "message",
                            title: "Service Notes",
                            value: "Ensure all old furniture is removed prior to installation. Coordinate with on-site manager for access and layout adjustments."
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
