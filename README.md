# MySwiftUIAssignment

A comprehensive SwiftUI application for managing service projects, such as office space revamps and workspace makeovers. This modern iOS/macOS app demonstrates advanced SwiftUI development practices including MVVM architecture, reactive programming with Combine, async/await concurrency, location services integration, and professional UI component design with TablerIcons.

## Features

- **Project List View**: Displays a scrollable list of service projects with key information including title, company, description, status, and scheduled time.
- **Project Cards**: Each project is presented in a card format with visual indicators (colored circles) and status badges.
- **Project Details**: Comprehensive detail view for each project including:
  - Interactive map showing the service location with project-specific coordinates
  - Dynamic Apple Maps markers showing each project's unique geographic location
  - Customer information with professional iconography
  - Service description with text wrapping support
  - Scheduled time with intelligent formatting
  - Location details with coordinate display and map integration
  - Service notes and additional project information
- **Advanced Search**: Real-time search with Combine framework and 300ms debounce delay, filtering projects by title, company, and description.
- **Pull-to-Refresh**: Async pull-to-refresh functionality for updating project data with loading indicator and thread safety.
- **Dynamic Time Display**: Intelligent time formatting showing "Today", "Tomorrow", "Yesterday", or full dates with 12-hour AM/PM format.
- **Location Services**: Each project includes latitude/longitude coordinates with nearby location distribution for realistic service areas.
- **Navigation**: Smooth navigation between list and detail views using SwiftUI's NavigationStack with proper state management.
- **Professional UI**: Consistent iconography using TablerIcons library with centralized icon management.

## Project Structure

```
MySwiftUIAssignment/
├── MySwiftUIAssignment/
│   ├── AppConstant/
│   │   └── [App constants and configurations]
│   ├── Assets/
│   │   └── Assets.xcassets/          # App icons and color assets
│   ├── Constant/
│   │   └── Color+Assets.swift        # Color extensions for custom assets
│   ├── Model/
│   │   └── ListModel.swift           # Project and Status data models with location support
│   ├── ReusableComponents/
│   │   ├── InfoRow.swift             # Reusable info row component with TablerIcons
│   │   ├── PixelDivider.swift        # Pixel-perfect divider component with customization
│   │   ├── StatusBadge.swift         # Status badge component
│   │   └── TablerIconView.swift      # Reusable TablerIcon wrapper component
│   ├── View/
│   │   ├── ContentView.swift         # Main content view with navigation (refactored)
│   │   ├── JobDetailView.swift       # Comprehensive job detail view with map (refactored)
│   │   ├── ProjectCardView.swift     # Card view for project list items (refactored)
│   │   ├── ProjectDetailView.swift   # Project detail navigation view (refactored)
│   │   ├── ProjectHeaderView.swift   # Header with title and search bar (refactored)
│   │   └── ProjectListView.swift     # List view containing project cards (refactored)
│   ├── ViewModel/
│   │   └── SearchViewModel.swift     # View model for search and data management
│   └── MySwiftUIAssignmentApp.swift  # App entry point
├── MySwiftUIAssignment.xcodeproj/    # Xcode project files
├── MySwiftUIAssignmentTests/         # Unit tests
└── MySwiftUIAssignmentUITests/       # UI tests
```

## Data Models

### Project
- `id`: Unique identifier (UUID)
- `title`: Project title (e.g., "Office Space Revamp")
- `company`: Client company name
- `description`: Brief project description
- `status`: Project status (Planned, Scheduled, Confirmed)
- `time`: Date object for scheduling (dynamically formatted for display)
- `indicatorColor`: Color for visual indicator
- `latitude`: Geographic latitude coordinate (Double)
- `longitude`: Geographic longitude coordinate (Double)
- `formattedTime`: Computed property returning contextual time string

### Status Enum
Defines project statuses with associated colors and text colors:
- `planned`: Blue theme
- `scheduled`: Green theme  
- `confirmed`: Green theme

## Key Components

### Views (Refactored with SwiftUI Standards)
- **ContentView**: Root view managing navigation stack and view model with optimized structure
- **ProjectListView**: Displays list of projects using SwiftUI List with pull-to-refresh and extension-based styling
- **ProjectCardView**: Individual project card with status indicators, typography constants, and subview decomposition
- **ProjectDetailView**: Navigation wrapper for project details with comprehensive previews
- **JobDetailView**: Comprehensive job details with interactive map, dynamic coordinates, and modular subviews
- **ProjectHeaderView**: App header with search functionality using TablerIcons and structured constants

### View Models
- **SearchViewModel**: Manages search state, filtering, and data refresh using Combine and async/await with location data

### Reusable Components (Enhanced)
- **InfoRow**: Standardized information display component with TablerIcon and text (updated for TablerIcons)
- **StatusBadge**: Color-coded status indicator with rounded capsule design
- **PixelDivider**: Environment-aware divider for pixel-perfect lines with customization options
- **TablerIconView**: Reusable wrapper for TablerIcons with configurable size and color parameters

### Utilities
- **Color Extensions**: Custom colors loaded from asset catalog
- **Typography Constants**: Centralized font management across components
- **Layout Constants**: Named spacing and sizing values for consistency

## Technologies Used

- **SwiftUI**: Modern UI framework for iOS/macOS with advanced view composition and state management
- **Combine**: Reactive programming framework for real-time search functionality with debouncing
- **Swift Concurrency**: Async/await for pull-to-refresh implementation and thread-safe operations
- **MapKit**: Native Apple Maps integration with dynamic location markers and coordinate management
- **NavigationStack**: Hierarchical navigation with proper state management and deep linking support
- **TablerIcons**: Professional icon library providing consistent, scalable iconography throughout the app
- **Asset Catalog**: Comprehensive asset management for colors, icons, and design tokens
- **Swift Result Builders**: Advanced @ViewBuilder patterns for complex view composition
- **Environment Values**: Dynamic display scale adaptation for pixel-perfect rendering

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/vidhyapathikandhasamy/MySwiftUIAssignment.git
   ```

2. Open the project in Xcode:
   ```bash
   open MySwiftUIAssignment.xcodeproj
   ```

3. Add TablerIcons package dependency:
   - In Xcode: File → Add Packages...
   - Enter: `https://github.com/tabler/tabler-icons-swift`
   - Add to your target

4. Build and run the app on a simulator or device.

## Requirements

- iOS 16.0+ or macOS 13.0+
- Xcode 14.0+
- Swift 5.7+

## Dependencies

- **TablerIcons**: Professional icon library
  - Repository: `https://github.com/tabler/tabler-icons-swift`
  - Add via Xcode: File → Add Packages... → Enter repository URL

## Implementation Details

### Advanced Search Functionality
- **Debounced Search**: 300ms delay using Combine's `debounce` operator for optimal performance
- **Multi-field Search**: Filters by project title, company name, and description simultaneously
- **Case-insensitive**: All searches are converted to lowercase for better user experience
- **Real-time Updates**: Results update as user types (after debounce delay) with smooth UI transitions
- **State Preservation**: Search filter maintained during pull-to-refresh operations

### Async Pull-to-Refresh Implementation
- **Swift Concurrency**: Uses modern async/await for non-blocking refresh operations
- **Simulated Network Delay**: 1-second delay to demonstrate loading behavior and UX patterns
- **Thread Safety**: UI updates performed on main thread using `MainActor` for safe state management
- **Search State Preservation**: Maintains current search filter after refresh completion
- **Loading States**: Visual feedback during refresh operations

### Location Services & Geographic Data
- **Dynamic Coordinates**: Each project includes unique latitude/longitude coordinates
- **Geographic Distribution**: Projects positioned within 1-2km radius for realistic service areas
- **Map Integration**: Interactive maps with project-specific markers and zoom controls
- **Coordinate Display**: Human-readable coordinate information in project details
- **Location Accuracy**: Precise geographic positioning for service scheduling

### Reusable Component Architecture
- **TablerIconView**: Centralized icon management component providing:
  - Consistent styling across all TablerIcons with configurable parameters
  - Template rendering for proper tinting and accessibility
  - Size and color customization with sensible defaults
  - Easy maintenance and theme updates
- **InfoRow**: Updated to use TablerIcons instead of SF Symbols for design consistency
- **ProjectCardView**: Refactored with subview decomposition and typography constants
- **PixelDivider**: Environment-aware divider with customization options
- **Extension-based Styling**: Reusable view modifiers for consistent UI patterns

### Advanced SwiftUI Patterns
- **@ViewBuilder Decomposition**: Complex views broken into manageable subview components
- **Constants-driven Design**: Named constants for spacing, colors, and typography
- **Preview Variations**: Multiple preview configurations for comprehensive testing
- **Documentation Comments**: Comprehensive API documentation with usage examples
- **MARK Organization**: Clear code structure with logical section separation

## Architecture Notes

- **MVVM Pattern**: Implemented with ObservableObject view models managing state and business logic
- **Reactive Programming**: Combine framework for real-time search with debouncing and state management
- **Reusable Component Architecture**: Modular components for consistent UI and maintainability
- **Icon System**: Centralized TablerIcon management through TablerIconView for consistent styling
- **Async/Await**: Modern Swift concurrency for pull-to-refresh and data operations
- **Modular Structure**: Organized into logical folders (Model, View, ViewModel, ReusableComponents, Assets, Constant)
- **Component Reusability**: Dedicated folder for shared UI components with consistent APIs
- **Separation of Concerns**: Each view has clear responsibilities with proper state management
- **Thread Safety**: MainActor for UI updates in async operations
- **Constants-driven Design**: Named constants for spacing, colors, and typography throughout the app
- **@ViewBuilder Patterns**: Advanced view composition with subview decomposition
- **Extension-based Styling**: Reusable view modifiers for consistent UI patterns
- **Comprehensive Documentation**: Full API documentation with usage examples and previews
- **Preview-driven Development**: Multiple preview configurations for testing and validation

## Future Enhancements

- Add data persistence with Core Data or SwiftData
- Integrate with backend API for real-time data synchronization
- Add project creation, editing, and deletion capabilities
- Implement user authentication and role-based access
- Add push notifications for project updates and reminders
- Include project progress tracking and status updates
- Add offline support with data caching
- Implement advanced filtering and sorting options

---

Created by Vidhyapathi on April 6, 2026  
Last updated: April 7, 2026

## Project Status

✅ **Fully Implemented Features:**
- Complete SwiftUI refactoring with modern standards
- Comprehensive documentation and code comments
- TablerIcons integration throughout the application
- Location services with geographic coordinates
- Advanced search and pull-to-refresh functionality
- Professional UI components and reusable architecture
- Multiple preview configurations for testing
- Thread-safe async operations
- MVVM pattern implementation

🔧 **Code Quality:**
- Zero compilation errors
- Comprehensive test coverage with previews
- Consistent code formatting and organization
- Proper error handling and state management
- Performance optimized with debouncing and async operations
