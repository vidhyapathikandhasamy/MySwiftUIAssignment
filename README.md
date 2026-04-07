# MySwiftUIAssignment

A SwiftUI application for managing service projects, such as office space revamps and workspace makeovers. This app allows users to view a list of scheduled projects, browse project details, and navigate through service information.

## Features

- **Project List View**: Displays a scrollable list of service projects with key information including title, company, description, status, and scheduled time.
- **Project Cards**: Each project is presented in a card format with visual indicators (colored circles) and status badges.
- **Project Details**: Detailed view for each project including:
  - Interactive map showing the service location
  - Customer information
  - Service description
  - Scheduled time
  - Location details with map integration
  - Service notes
- **Search Functionality**: Real-time search with Combine framework and 300ms debounce delay, filtering projects by title, company, and description.
- **Pull-to-Refresh**: Async pull-to-refresh functionality for updating project data with loading indicator.
- **Navigation**: Smooth navigation between list and detail views using SwiftUI's NavigationStack.

## Project Structure

```
MySwiftUIAssignment/
├── MySwiftUIAssignment/
│   ├── AppConstant/
│   │   └── Assets.xcassets/          # App icons and color assets
│   ├── Constant/
│   │   └── Color+Assets.swift        # Color extensions for custom assets
│   ├── Model/
│   │   └── ListModel.swift           # Project and Status data models
│   ├── View/
│   │   ├── ContentView.swift         # Main content view with navigation
│   │   ├── PixelDivider.swift        # Pixel-perfect divider component
│   │   ├── ProjectCardView.swift     # Card view for project list items
│   │   ├── ProjectDetailView.swift   # Detailed project information view
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
- `time`: Scheduled time string
- `indicatorColor`: Color for visual indicator

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
- **ProjectDetailView**: Comprehensive project details with map integration
- **ProjectHeaderView**: App header with search functionality

### View Models
- **SearchViewModel**: Manages search state, filtering, and data refresh using Combine and async/await

### Utilities
- **PixelDivider**: Environment-aware divider for pixel-perfect lines
- **Color Extensions**: Custom colors loaded from asset catalog

## Technologies Used

- **SwiftUI**: Modern UI framework for iOS/macOS
- **Combine**: Reactive programming framework for search functionality
- **Swift Concurrency**: Async/await for pull-to-refresh implementation
- **MapKit**: For location and map display
- **NavigationStack**: For hierarchical navigation
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

3. Build and run the app on a simulator or device.

## Requirements

- iOS 16.0+ or macOS 13.0+
- Xcode 14.0+
- Swift 5.7+

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

## Architecture Notes

- **MVVM Pattern**: Implemented with ObservableObject view models managing state and business logic
- **Reactive Programming**: Combine framework for real-time search with debouncing
- **Async/Await**: Modern Swift concurrency for pull-to-refresh operations
- **Modular Structure**: Organized into logical folders (Model, View, ViewModel, Constant)
- **Reusable Components**: Common UI elements like InfoRow and StatusBadge
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
