//
//  TablerIconView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 07/04/26.
//

import SwiftUI
import TablerIcons

struct TablerIconView: View {
    let icon: UIImage
    let size: CGFloat
    let color: Color
    
    init(icon: UIImage, size: CGFloat = 18, color: Color = .iconColor) {
        self.icon = icon
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Image(uiImage: icon)
            .renderingMode(.template)
            .resizable()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}

#Preview {
    VStack(spacing: 20) {
        TablerIconView(icon: TablerIcons.userCircleOutlined)
    }
    .padding()
}
