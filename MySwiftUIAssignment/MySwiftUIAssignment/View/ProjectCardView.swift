//
//  ProjectCardView.swift
//  MySwiftUIAssignment
//
//  Created by Vidhyapathi on 06/04/26.
//

import SwiftUI
import TablerIcons

/// A card view component that displays a single project with its key information.
///
/// ProjectCardView presents project details in a visually appealing card format with:
/// - Project title with status indicator
/// - Company information with icon
/// - Project description with text wrapping
/// - Status badge showing current project status
/// - Formatted time display
/// - Rounded corners and subtle border for visual separation
///
/// Example usage:
/// ```
/// ProjectCardView(project: myProject)
/// ```
struct ProjectCardView: View {
    // MARK: - Properties
    
    /// The project data to display in the card
    let project: Project
    
    // MARK: - Constants
    
    /// Spacing between card elements
    private let elementSpacing: CGFloat = 12
    
    /// Padding inside the card
    private let cardPadding: CGFloat = 16
    
    /// Corner radius for the card
    private let cardCornerRadius: CGFloat = 16
    
    /// Width and height of the status indicator circle
    private let statusIndicatorSize: CGFloat = 10
    
    /// Size of icons in the card
    private let iconSize: CGFloat = 18
    
    /// Corner radius for the status badge
    private let statusBadgeCornerRadius: CGFloat = 20
    
    /// Badge indicator square size
    private let badgeIndicatorSize: CGFloat = 6
    
    /// Horizontal padding for status badge
    private let statusBadgePaddingHorizontal: CGFloat = 12
    
    /// Vertical padding for status badge
    private let statusBadgePaddingVertical: CGFloat = 6
    
    /// Border color opacity
    private let borderOpacity: CGFloat = 0.3
    
    /// Border line width
    private let borderLineWidth: CGFloat = 1
    
    // MARK: - Typography
    
    /// Font for project title
    private let titleFont: Font = .body
    
    /// Font weight for project title
    private let titleFontWeight: Font.Weight = .bold
    
    /// Font for company and description text
    private let secondaryTextFont: Font = .subheadline
    
    /// Font for status badge text
    private let badgeTextFont: Font = .caption2
    
    /// Font weight for status badge text
    private let badgeTextFontWeight: Font.Weight = .medium
    
    /// Font for time display
    private let timeFont: Font = .caption
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: elementSpacing) {
            // MARK: - Header Section
            
            headerSection
            
            // MARK: - Company Section
            
            companySection
            
            // MARK: - Description Section
            
            descriptionSection
            
            // MARK: - Footer Section
            
            footerSection
        }
        .cardStyling(padding: cardPadding, cornerRadius: cardCornerRadius)
    }
    
    // MARK: - Subviews
    
    /// Header section with project title and status indicator
    @ViewBuilder
    private var headerSection: some View {
        HStack(spacing: 0) {
            /// Project title
            Text(project.title)
                .font(titleFont)
                .fontWeight(titleFontWeight)
            
            Spacer()
            
            /// Status indicator circle
            Circle()
                .fill(project.indicatorColor)
                .frame(width: statusIndicatorSize, height: statusIndicatorSize)
        }
    }
    
    /// Company information section with icon
    @ViewBuilder
    private var companySection: some View {
        HStack(spacing: 8) {
            /// Company icon
            TablerIconView(icon: TablerIcons.userCircleOutlined, size: iconSize)
            
            /// Company name
            Text(project.company)
                .font(secondaryTextFont)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
    }
    
    /// Description section with icon and wrapped text
    @ViewBuilder
    private var descriptionSection: some View {
        HStack(alignment: .top, spacing: 8) {
            /// Description icon
            TablerIconView(icon: TablerIcons.fileDescriptionOutlined, size: iconSize)
            
            /// Project description with flexible height
            Text(project.description)
                .font(secondaryTextFont)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    /// Footer section with status badge and time
    @ViewBuilder
    private var footerSection: some View {
        HStack(spacing: 12) {
            /// Status badge showing project status
            statusBadge
            
            Spacer()
            
            /// Formatted time display
            Text(project.formattedTime)
                .font(timeFont)
                .foregroundColor(.gray)
        }
    }
    
    /// Status badge component with indicator and status text
    @ViewBuilder
    private var statusBadge: some View {
        HStack(spacing: 6) {
            /// Status indicator square
            RoundedRectangle(cornerRadius: badgeIndicatorSize / 2)
                .fill(project.status.textColor.opacity(0.3))
                .frame(width: badgeIndicatorSize * 2, height: badgeIndicatorSize * 2)
            
            /// Status title text
            Text(project.status.title)
                .font(badgeTextFont)
                .fontWeight(badgeTextFontWeight)
                .foregroundColor(project.status.textColor)
        }
        .padding(.horizontal, statusBadgePaddingHorizontal)
        .padding(.vertical, statusBadgePaddingVertical)
        .background(project.status.color)
        .cornerRadius(statusBadgeCornerRadius)
    }
}

// MARK: - Card Styling Extension

/// Extension to apply consistent card styling
private extension View {
    /// Applies standard card styling with padding, background, and border
    ///
    /// - Parameters:
    ///   - padding: Internal padding for the card
    ///   - cornerRadius: Radius for rounded corners
    /// - Returns: A styled view with card appearance
    func cardStyling(padding: CGFloat, cornerRadius: CGFloat) -> some View {
        self
            .padding(padding)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(cornerRadius)
    }
}

