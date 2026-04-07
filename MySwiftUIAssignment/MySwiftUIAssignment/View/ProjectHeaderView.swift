import SwiftUI
import TablerIcons

/// A header view component that displays a title and optional search bar.
///
/// ProjectHeaderView is used at the top of the project list screen to provide:
/// - A prominent title section
/// - An integrated search bar for filtering projects
/// - Visual consistency with white background and proper padding
/// - Support for toggling search bar visibility
struct ProjectHeaderView: View {
    // MARK: - Properties
    
    /// Binding to the search text from the parent view model
    @Binding var searchText: String
    
    /// The title text displayed in the header
    var titleText: String
    
    /// Flag to toggle search bar visibility
    var showSearchBar: Bool
    
    // MARK: - Constants
    
    /// Radius for search bar corner rounding
    private let searchBarCornerRadius: CGFloat = 12
    
    /// Padding inside the search bar
    private let searchBarPadding: CGFloat = 12
    
    /// Spacing between title and search bar
    private let verticalSpacing: CGFloat = 16
    
    /// Horizontal padding for the entire view
    private let horizontalPadding: CGFloat = 16
    
    /// Top padding for the entire view
    private let topPadding: CGFloat = 8
    
    /// Size for search bar icons
    private let iconSize: CGFloat = 18
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: verticalSpacing) {
            // MARK: - Title Section
            
            titleView
            
            // MARK: - Search Section
            
            if showSearchBar {
                searchBarView
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, topPadding)
        .background(Color.white)
    }
    
    // MARK: - Subviews
    
    /// The title text view with typography styling
    @ViewBuilder
    private var titleView: some View {
        Text(titleText)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /// The search bar with magnifying glass icon and microphone button
    @ViewBuilder
    private var searchBarView: some View {
        HStack(spacing: 12) {
            // MARK: - Search Icon
            
            /// Magnifying glass icon from TablerIcons indicating search functionality
            TablerIconView(icon: TablerIcons.searchOutlined, size: iconSize, color: .gray)
            
            // MARK: - Search Field
            
            /// Text field for user input with binding to view model
            TextField("Search", text: $searchText)
                .textFieldStyle(.plain)
            
            Spacer()
            
            // MARK: - Microphone Icon
            
            /// Microphone icon from TablerIcons for voice search (visual placeholder)
            TablerIconView(icon: TablerIcons.microphoneOutlined, size: iconSize, color: .gray)
        }
        .padding(searchBarPadding)
        .background(Color(.systemGray6))
        .cornerRadius(searchBarCornerRadius)
    }
}
