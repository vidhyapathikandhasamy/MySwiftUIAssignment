//
//  ListModel.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct Project: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let company: String
    let description: String
    let status: Status
    let time: Date
    let indicatorColor: Color
    
    var formattedTime: String {
        let calendar = Calendar.current
        let now = Date()
        
        // Check if it's today
        if calendar.isDate(time, inSameDayAs: now) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "h:mm a"
            return "Today, \(timeFormatter.string(from: time))"
        }
        
        // Check if it's tomorrow
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: now),
           calendar.isDate(time, inSameDayAs: tomorrow) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "h:mm a"
            return "Tomorrow, \(timeFormatter.string(from: time))"
        }
        
        // Check if it's yesterday
        if let yesterday = calendar.date(byAdding: .day, value: -1, to: now),
           calendar.isDate(time, inSameDayAs: yesterday) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "h:mm a"
            return "Yesterday, \(timeFormatter.string(from: time))"
        }
        
        // For other dates, use DD/MM/YYYY format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a"
        return dateFormatter.string(from: time)
    }
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
