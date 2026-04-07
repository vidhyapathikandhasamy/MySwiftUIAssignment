# MySwiftUIAssignment

A SwiftUI application for managing service projects, such as office space revamps and workspace makeovers. This app allows users to view a list of scheduled projects, browse project details, and navigate through service information.

## Features

- **Project List View**: Displays a scrollable list of service projects with key information including title, company, description, status, and scheduled time.
- **Project Cards**: Each project is presented in a card format with visual indicators (colored circles) and status badges.
- **Project Details**: Detailed view for each project including:
  - Interactive map showing the service location
  - Default Apple Maps marker at hardcoded coordinates `12.977723304991823, 80.2515434176114`
  - Customer information
  - Service description
  - Scheduled time
  - Location details with map integration
  - Service notes
- **Search Functionality**: Real-time search with Combine framework and 300ms debounce delay, filtering projects by title, company, and description.
- **Pull-to-Refresh**: Async pull-to-refresh functionality for updating project data with loading indicator.
- **Dynamic Time Display**: Intelligent time formatting showing "Today", "Tomorrow", "Yesterday", or full dates with 12-hour AM/PM format.
- **Navigation**: Smooth navigation between list and detail views using SwiftUI's NavigationStack.

## Project Structure

```
MySwiftUIAssignment/
├── MySwiftUIAssignment/
│   ├── Assets/
│   │   └── Assets.xcassets/          # App icons and color assets
│   ├── Constant/
│   │   └── Color+Assets.swift        # Color extensions for custom assets
│   ├── Model/
│   │   └── ListModel.swift           # Project and Status data models
│   ├── ReusableComponents/
│   │   ├── InfoRow.swift             # Reusable info row component with TablerIcons
│   │   ├── PixelDivider.swift        # Pixel-perfect divider component
│   │   ├── StatusBadge.swift         # Status badge component
│   │   └── TablerIconView.swift      # Reusable TablerIcon wrapper component
│   ├── View/
│   │   ├── ContentView.swift         # Main content view with navigation
│   │   ├── JobDetailView.swift       # Job detail view with map
│   │   ├── ProjectCardView.swift     # Card view for project list items
│   │   ├── ProjectDetailView.swift   # Project detail navigation view
│   │   ├── ProjectHeaderView.swift   # Header with title and search bar
│   │   └── ProjectListView.swift     # List view containing project cards
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
- `formattedTime`: Computed property returning contextual time string

### Status Enum
Defines project statuses with associated colors and text colors:
- `planned`: Blue theme
- `scheduled`: Green theme  
- `confirmed`: Green theme

## Key Components

### Views
- **ContentView**: Root view managing navigation stack and view model
- **ProjectListView**: Displays list of projects using SwiftUI List with pull-to-refresh
- **ProjectCardView**: Individual project card with status indicators
- **ProjectDetailView**: Navigation wrapper for project details
- **JobDetailView**: Comprehensive job details with interactive map and marker
- **ProjectHeaderView**: App header with search functionality

### View Models
- **SearchViewModel**: Manages search state, filtering, and data refresh using Combine and async/await

### Reusable Components
- **InfoRow**: Standardized information display component with TablerIcon and text
- **StatusBadge**: Color-coded status indicator with rounded capsule design
- **PixelDivider**: Environment-aware divider for pixel-perfect lines
- **TablerIconView**: Reusable wrapper for TablerIcons with configurable size and color

### Utilities
- **Color Extensions**: Custom colors loaded from asset catalog

## Technologies Used

- **SwiftUI**: Modern UI framework for iOS/macOS
- **Combine**: Reactive programming framework for search functionality
- **Swift Concurrency**: Async/await for pull-to-refresh implementation
- **MapKit**: For location and map display with markers
- **NavigationStack**: For hierarchical navigation
- **TablerIcons**: Professional icon library for consistent UI elements
- **Asset Catalog**: For managing colors and icons

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

### Search Functionality
- **Debounced Search**: 300ms delay using Combine's `debounce` operator
- **Multi-field Search**: Filters by project title, company name, and description
- **Case-insensitive**: All searches are converted to lowercase for better UX
- **Real-time Updates**: Results update as user types (after debounce delay)

### Pull-to-Refresh
- **Async Implementation**: Uses Swift's async/await for non-blocking refresh
- **Simulated Network Delay**: 1-second delay to demonstrate loading behavior
- **Thread Safety**: UI updates performed on main thread using `MainActor`
- **Search State Preservation**: Maintains current search filter after refresh

### Reusable Component Architecture
- **TablerIconView**: Centralized icon management component providing:
  - Consistent styling across all TablerIcons
  - Configurable size and color parameters
  - Template rendering for proper tinting
  - Easy maintenance and updates
- **InfoRow**: Updated to use TablerIcons instead of SF Symbols for consistency
- **ProjectCardView**: Refactored to use TablerIconView for maintainable icon usage
- **Tabler Icons**: Consistent icon library used throughout the app via TablerIconView component
- **TablerIconView Component**: Reusable wrapper providing:
  - Configurable size (default: 18pt)
  - Configurable color (default: .iconColor)
  - Template rendering for tinting
- **Project Card Icons**:
  - User circle icon (`TablerIcons.userCircleOutlined`) for company/client information
  - File description icon (`TablerIcons.fileDescriptionOutlined`) for project descriptions
- **Detail View Icons**:
  - User circle outlined (`TablerIcons.userCircleOutlined`) for customer info
  - File description outlined (`TablerIcons.fileDescriptionOutlined`) for descriptions
  - Clock outlined (`TablerIcons.clockOutlined`) for scheduled times
  - Map pin outlined (`TablerIcons.mapPinOutlined`) for locations
  - Message outlined (`TablerIcons.messageOutlined`) for service notes

## Architecture Notes

- **MVVM Pattern**: Implemented with ObservableObject view models managing state and business logic
- **Reactive Programming**: Combine framework for real-time search with debouncing
- **Reusable Component Architecture**: Modular components for consistent UI and maintainability
- **Icon System**: Centralized TablerIcon management through TablerIconView for consistent styling
- **Async/Await**: Modern concurrency for pull-to-refresh and data operations
- **Async/Await**: Modern Swift concurrency for pull-to-refresh operations
- **Modular Structure**: Organized into logical folders (Model, View, ViewModel, ReusableComponents, Assets, Constant)
- **Component Reusability**: Dedicated folder for shared UI components (InfoRow, StatusBadge, PixelDivider)
- **Separation of Concerns**: JobDetailView extracted as separate component for better maintainability
- **Thread Safety**: MainActor for UI updates in async operations

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
