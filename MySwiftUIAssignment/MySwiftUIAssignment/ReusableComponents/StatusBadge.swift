//
//  StatusBadge.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 07/04/26.
//
import SwiftUI

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
