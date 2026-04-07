//
//  JobDetailView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 07/04/26.
//

import SwiftUI
import MapKit
import TablerIcons

/// A detailed view component that displays comprehensive project information.
///
/// JobDetailView presents all aspects of a service project including:
/// - Interactive map with location marker
/// - Project header with title and status
/// - Detailed information sections (customer, description, time, location, notes)
/// - Action buttons for job management
///
/// Example usage:
/// ```
/// JobDetailView(project: myProject)
/// ```
struct JobDetailView: View {
    // MARK: - Properties

    /// The project to display detailed information for
    let project: Project

    // MARK: - State

    /// Map region state for zoom and pan functionality
    @State private var region: MKCoordinateRegion

    // MARK: - Constants

    /// Fixed location coordinate for the service
    private var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: project.latitude, longitude: project.longitude)
    }

    /// Map height in points
    private let mapHeight: CGFloat = 200

    /// Corner radius for map and sections
    private let cornerRadius: CGFloat = 16

    /// Spacing between major sections
    private let sectionSpacing: CGFloat = 16

    /// Spacing between info rows
    private let infoRowSpacing: CGFloat = 20

    /// Horizontal padding for content
    private let horizontalPadding: CGFloat = 16

    /// Vertical padding for sections
    private let sectionPadding: CGFloat = 16

    /// Top padding for the entire view
    private let topPadding: CGFloat = 16

    /// Service notes text
    private let serviceNotes = "Ensure all old furniture is removed prior to installation. Coordinate with on-site manager for access and layout adjustments."

    /// Coordinate display text
    private var coordinateText: String {
        "Coordinate: \(project.latitude), \(project.longitude)"
    }

    // MARK: - Initialization

    /// Creates a job detail view with the specified project
    ///
    /// - Parameter project: The project to display
    init(project: Project) {
        self.project = project
        self._region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: project.latitude, longitude: project.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: sectionSpacing) {
                    // MARK: - Map Section

                    mapSection

                    // MARK: - Header Section

                    headerSection

                    // MARK: - Information Section

                    informationSection
                }
                .padding(.top, topPadding)
            }
        }
        .background(Color.white)
    }

    // MARK: - Subviews

    /// Interactive map section showing service location
    @ViewBuilder
    private var mapSection: some View {
        Map(coordinateRegion: $region, annotationItems: [MapPin(coordinate: locationCoordinate)]) { pin in
            MapMarker(coordinate: pin.coordinate, tint: .red)
        }
        .frame(height: mapHeight)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal, horizontalPadding)
    }

    /// Header section with project title and status badge
    @ViewBuilder
    private var headerSection: some View {
        HStack {
            /// Project title
            Text(project.title)
                .font(.title2)
                .fontWeight(.semibold)

            Spacer()

            /// Status badge
            StatusBadge(text: project.status.title)
        }
        .padding(.horizontal, horizontalPadding)
    }

    /// Information section containing all project details
    @ViewBuilder
    private var informationSection: some View {
        VStack(spacing: infoRowSpacing) {
            /// Customer information row
            InfoRow(
                icon: TablerIcons.userCircleOutlined,
                title: "Customer",
                value: project.company
            )

            /// Project description row
            InfoRow(
                icon: TablerIcons.fileDescriptionOutlined,
                title: "Description",
                value: project.description
            )

            /// Scheduled time row
            InfoRow(
                icon: TablerIcons.clockOutlined,
                title: "Scheduled Time",
                value: project.formattedTime
            )

            /// Location row with map opening action
            Button(action: openMaps) {
                InfoRow(
                    icon: TablerIcons.mapPinOutlined,
                    title: "Location",
                    value: coordinateText
                )
            }
            .buttonStyle(.plain)

            /// Service notes row
            InfoRow(
                icon: TablerIcons.messageOutlined,
                title: "Service Notes",
                value: serviceNotes
            )
        }
        .padding(sectionPadding)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal, horizontalPadding)
    }

    // MARK: - Actions

    /// Opens the native Maps app with the service location
    private func openMaps() {
        print("Open Maps tapped")
    }

    /// Starts the job (placeholder for future implementation)
    private func startJob() {
        print("Start Job tapped")
    }

    /// Contacts the customer (placeholder for future implementation)
    private func contactCustomer() {
        print("Call Customer tapped")
    }
}

// MARK: - Supporting Types

/// Map pin annotation for displaying location markers
private struct MapPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}



#Preview("Confirmed Job Detail") {
    let calendar = Calendar.current
    let now = Date()

    let mockProject = Project(
        title: "Executive Suite Renovation",
        company: "TechCorp Inc",
        description: "Complete renovation of executive offices with premium finishes and state-of-the-art technology integration.",
        status: .confirmed,
        time: calendar.date(byAdding: .day, value: -1, to: now)!,
        indicatorColor: .approvedColor,
        latitude: 37.3349,
        longitude: -122.0090
    )

    JobDetailView(project: mockProject)
    .previewDisplayName("Confirmed Project Details")
}
