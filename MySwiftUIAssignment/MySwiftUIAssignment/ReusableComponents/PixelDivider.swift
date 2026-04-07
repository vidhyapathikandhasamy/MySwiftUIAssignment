//
//  PixelDivider.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI

/// A pixel-perfect divider view that respects the device's display scale.
///
/// PixelDivider creates a thin, crisp horizontal line at exactly 1 pixel
/// on any device, accounting for different display scales (1x, 2x, 3x).
/// This component is used throughout the app to provide visual separation between sections.
///
/// Example usage:
/// ```
/// VStack {
///     Text("Section 1")
///     PixelDivider()
///     Text("Section 2")
/// }
/// ```
struct PixelDivider: View {
    // MARK: - Environment
    
    /// The display scale of the current device (1x, 2x, 3x, etc.)
    @Environment(\.displayScale) private var displayScale
    
    // MARK: - Properties
    
    /// The color of the divider line
    var color: Color
    
    /// The opacity of the divider line
    var opacity: Double
    
    // MARK: - Constants
    
    /// The ideal divider height which will be scaled based on device display scale
    private let baseHeight: CGFloat = 1.0
    
    /// Minimum display scale to use if not available
    private let minimumDisplayScale: CGFloat = 1
    
    // MARK: - Initialization
    
    /// Creates a pixel divider with optional customization.
    ///
    /// - Parameters:
    ///   - color: The color of the divider. Defaults to gray.
    ///   - opacity: The opacity level (0-1). Defaults to 0.4 for subtle appearance.
    init(color: Color = .gray, opacity: Double = 0.4) {
        self.color = color
        self.opacity = opacity
    }
    
    // MARK: - Body
    
    var body: some View {
        Rectangle()
            .fill(color.opacity(opacity))
            .frame(height: baseHeight / max(displayScale, minimumDisplayScale))
    }
}
