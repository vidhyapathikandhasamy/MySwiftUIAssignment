//
//  ProjectHeaderView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//
import SwiftUI

struct ProjectHeaderView: View {
    @Binding var searchText: String
    
    var titleText: String
    
    var showSearchBar: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Title
            Text(titleText)
                .font(.title2)
                .fontWeight(.semibold)
            
            // Search Bar
            if showSearchBar {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    Spacer()
                    
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            
            
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .background(Color.white)
    }
}
