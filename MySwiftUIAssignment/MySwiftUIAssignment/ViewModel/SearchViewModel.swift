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
        let projects = [
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
