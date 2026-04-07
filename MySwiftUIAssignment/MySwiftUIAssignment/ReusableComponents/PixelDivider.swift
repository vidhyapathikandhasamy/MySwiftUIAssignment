//
//  PixelDivider.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//
import SwiftUI

struct PixelDivider: View {
    @Environment(\.displayScale) private var displayScale

    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.4))
            .frame(height: 1.0 / max(displayScale, 1))
    }
}
