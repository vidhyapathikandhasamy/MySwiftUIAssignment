//
//  ContentView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                ProjectHeaderView(titleText: "Services", showSearchBar: true)
                    .padding(.bottom, 8)
                PixelDivider()
                ProjectListView()
            }
        }
    }
}



#Preview {
    ContentView()
}


