//
//  SearchViewModel.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 07/04/26.
//
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var filteredProjects: [Project] = []
    private var cancellables = Set<AnyCancellable>()
    private let allProjects: [Project]
    
    init() {
        let calendar = Calendar.current
        let now = Date()
        
        let projects = [
            Project(
                title: "Office Space Revamp",
                company: "XYZ Industries",
                description: "Transform your office with sleek, contemporary furnishings.",
                status: .planned,
                time: calendar.date(byAdding: .hour, value: 1, to: now)!, // Today, 1 hour from now
                indicatorColor: .planningColor,
                latitude: 12.977723304991823,
                longitude: 80.2515434176114
            ),
            Project(
                title: "Modern Workspace Makeover",
                company: "Acme Corp",
                description: "Revitalize your workspace with stylish, modern decor that inspires creativity.",
                status: .scheduled,
                time: calendar.date(byAdding: .day, value: 1, to: calendar.date(bySettingHour: 10, minute: 0, second: 0, of: now)!)!, // Tomorrow, 10:00 AM
                indicatorColor: .scheduledColor,
                latitude: 12.9785, // ~500m north
                longitude: 80.2521
            ),
            Project(
                title: "Contemporary Office Transformation",
                company: "Beta Solutions",
                description: "Elevate your office environment with chic, innovative designs.",
                status: .confirmed,
                time: calendar.date(byAdding: .day, value: -1, to: calendar.date(bySettingHour: 15, minute: 0, second: 0, of: now)!)!, // Yesterday, 3:00 PM
                indicatorColor: .approvedColor,
                latitude: 12.9768, // ~200m south
                longitude: 80.2509
            ),
            Project(
                title: "Executive Suite Renovation",
                company: "TechCorp Inc",
                description: "Complete renovation of executive offices with premium finishes.",
                status: .planned,
                time: calendar.date(from: DateComponents(year: 2024, month: 11, day: 15, hour: 14, minute: 30))!, // 15/11/2024, 2:30 PM
                indicatorColor: .planningColor,
                latitude: 12.9792, // ~800m north-east
                longitude: 80.2532
            ),
            Project(
                title: "Conference Room Upgrade",
                company: "Global Solutions",
                description: "Modernize conference facilities with latest technology.",
                status: .scheduled,
                time: calendar.date(byAdding: .hour, value: 2, to: now)!, // Today, 2 hours from now
                indicatorColor: .scheduledColor,
                latitude: 12.9759, // ~300m south-west
                longitude: 80.2498
            ),
            Project(
                title: "Reception Area Redesign",
                company: "Innovate Ltd",
                description: "Create welcoming reception space with contemporary design.",
                status: .confirmed,
                time: calendar.date(from: DateComponents(year: 2024, month: 12, day: 1, hour: 9, minute: 15))!, // 01/12/2024, 9:15 AM
                indicatorColor: .approvedColor,
                latitude: 12.9771, // ~150m west
                longitude: 80.2502
            )
        ]
        self.allProjects = projects
        self.filteredProjects = projects
        setupSearch()
    }
    
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.filterProjects(with: text)
            }
            .store(in: &cancellables)
    }
    
    private func filterProjects(with text: String) {
        if text.isEmpty {
            filteredProjects = allProjects
        } else {
            filteredProjects = allProjects.filter {
                $0.title.lowercased().contains(text.lowercased()) ||
                $0.company.lowercased().contains(text.lowercased()) ||
                $0.description.lowercased().contains(text.lowercased())
            }
        }
    }
    
    func refreshProjects() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Update on main thread
        await MainActor.run {
            filterProjects(with: searchText)
        }
    }
}
