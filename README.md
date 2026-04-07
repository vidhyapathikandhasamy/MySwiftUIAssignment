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
- **Search Functionality**: Header with search bar for filtering projects.
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
- **ContentView**: Root view managing navigation stack
- **ProjectListView**: Displays list of projects using SwiftUI List
- **ProjectCardView**: Individual project card with status indicators
- **ProjectDetailView**: Comprehensive project details with map integration
- **ProjectHeaderView**: App header with optional search functionality

### Utilities
- **PixelDivider**: Environment-aware divider for pixel-perfect lines
- **Color Extensions**: Custom colors loaded from asset catalog

## Technologies Used

- **SwiftUI**: Modern UI framework for iOS/macOS
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

## Architecture Notes

- **MVVM Pattern**: Views are separated from data models
- **Modular Structure**: Organized into logical folders (Model, View, Constant)
- **Reusable Components**: Common UI elements like InfoRow and StatusBadge
- **Hardcoded Data**: Currently uses static project data (can be extended to use Core Data or API)

## Future Enhancements

- Add data persistence with Core Data
- Implement search functionality
- Add project creation/editing capabilities
- Integrate with backend API for real-time data
- Add push notifications for project updates
- Implement user authentication

---

Created by Vidhyapathi on April 6, 2026
