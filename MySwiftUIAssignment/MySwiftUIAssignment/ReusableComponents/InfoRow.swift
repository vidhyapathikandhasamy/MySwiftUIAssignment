//
//  InfoRow.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 07/04/26.
//
import SwiftUI
import TablerIcons

struct InfoRow: View {
    let icon: UIImage
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            TablerIconView(icon: icon, size: 20)
                .frame(width: 28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
    }
}
