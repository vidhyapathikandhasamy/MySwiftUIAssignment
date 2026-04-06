//
//  ListModel.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    let title: String
    let company: String
    let description: String
    let status: Status
    let time: String
    let indicatorColor: Color
}

enum Status {
    case planned, scheduled, confirmed
    
    var title: String {
        switch self {
        case .planned: return "Planned"
        case .scheduled: return "Scheduled"
        case .confirmed: return "Confirmed"
        }
    }
    
    var color: Color {
        switch self {
        case .planned: return Color.blue.opacity(0.2)
        case .scheduled: return Color.green.opacity(0.2)
        case .confirmed: return Color.green.opacity(0.2)
        }
    }
    
    var textColor: Color {
        switch self {
        case .planned: return .blue
        case .scheduled: return .green
        case .confirmed: return .green
        }
    }
}
