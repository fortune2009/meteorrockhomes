### README for **MeteorRockHome**

---

#### **Project Overview**
MeteorRockHome is a Flutter-based mobile application designed to help users search for real estate properties on an interactive map. The app features Google Maps integration, dynamic property markers, search functionality, and various custom animations and UI elements. It is structured to maintain clean and readable code, ensuring every file contains approximately **100 lines of code** for better modularity and maintainability.

This README provides an overview of the app's structure and serves as a guide for new developers.

---

### **Core Features**
1. **Interactive Map**:
    - Google Maps integration using `google_maps_flutter`.
    - Custom markers for real estate properties.
    - Dark mode styling for the map.

2. **Property Search**:
    - Search bar powered by Google Places Autocomplete API.
    - Allows users to find properties in specific locations.

3. **Dynamic Markers**:
    - Property markers are represented as custom widgets (e.g., `AnimatedContainer`).
    - Animations for markers when a property is tapped.

4. **UI Animations**:
    - Text animations, container transitions, and ripple effects using Flutter's animation tools.
    - Smooth user experience for transitioning views and interacting with the map.

5. **Clean Code Architecture**:
    - Code is organized into modules, with each file containing focused functionality (~100 lines per file).

---

### **Project Structure**
```plaintext
lib/
├── main.dart                  # Entry point of the application.
├── modules/                   # App modules like Search and Property details.
│   ├── search/                # Contains all code related to property search and maps.
│   │   ├── search.dart        # Main SearchEstate screen (~100 lines of code).
│   │   ├── widgets.dart       # Reusable widgets for the Search module.
│   │   ├── utils.dart         # Helper functions for search functionality.
│   ├── property_details/      # Module for property details popup.
│       ├── details.dart       # Contains UI for showing property details.
├── shared/                    # Shared resources used across the app.
│   ├── utils/                 # Utility files like colors, assets, and styles.
│   │   ├── assets.dart        # Path definitions for SVGs and JSON files.
│   │   ├── colors.dart        # Centralized app color definitions.
│   │   ├── styles.dart        # Text styles and reusable text utilities.
│   ├── widgets/               # General reusable widgets.
├── assets/                    # Project assets (SVGs, JSON, etc.).
│   ├── json/                  # Map styles and configuration files.
│   ├── images/                # Static images.
│   ├── svgs/                  # SVG assets for icons.
```

---

### **Modules in Detail**

#### **1. Main Module**
- **`main.dart`**:
    - Initializes the app with the home screen `SearchEstate`.
    - Sets up app-wide themes and dependencies.
    - Starts the MaterialApp with routing support.

#### **2. Search Module**
- **`search.dart`**:
    - The main screen for users to interact with the map.
    - Implements Google Map (`GoogleMap` widget) and integrates `google_place` API.
    - Handles dynamic property marker creation and tap events.
    - Manages search results displayed as a list.

- **`widgets.dart`**:
    - Contains reusable components for the Search module, such as the search bar and options buttons.
    - Helps keep the `search.dart` file concise (~100 lines).

- **`utils.dart`**:
    - Utility functions for Search, such as converting API results to property models.
    - Helps keep API interaction logic separate from UI.

#### **3. Property Details Module**
- **`details.dart`**:
    - Displays detailed information about a property when a user taps a marker.
    - Contains a simple dialog-based UI for showing property info.

#### **4. Shared Utilities**
- **`assets.dart`**:
    - Centralized management of SVGs, JSON files, and other static resources.

- **`colors.dart`**:
    - Defines the app's color scheme, ensuring consistent styling throughout the app.

- **`styles.dart`**:
    - Text styles like headers, body text, and captions.

- **`space.dart`**:
    - Provides spacing utilities (e.g., `HSpace`, `VSpace`) for consistent padding and margins.

- **`widgets/`**:
    - Contains general-purpose widgets shared across the app, such as buttons or loaders.

---

### **Code Principles**

1. **Modular Design**:
    - Each module is self-contained, making it easier to read, test, and modify.
    - Files are limited to ~100 lines to improve clarity and separation of concerns.

2. **Reusable Components**:
    - Widgets and utilities are designed to be reused across multiple screens and modules.

3. **Clean Animations**:
    - Uses Flutter’s animation APIs (`AnimatedContainer`, `Tween`, `AnimationController`) for smooth, intuitive animations.

4. **Maintainability**:
    - Follows Dart/Flutter best practices for naming conventions and code organization.
    - Shared utilities and assets prevent duplication.

---

### **Setting Up the Project**

#### **Prerequisites**
1. Install Flutter: [Flutter Setup](https://flutter.dev/docs/get-started/install)
2. Set up Google Maps API key:
    - Enable **Google Maps SDK for Android/iOS** in the Google Cloud Console.
    - Add your API key in the `google_place` initialization in `search.dart`.

#### **Steps to Run**
1. Clone the repository:
   ```bash
   git clone https://github.com/fortune2009/meteorrockhomes.git
   cd MeteorRockHome
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

### **Customizing the App**

1. **Adding New Properties**:
    - Edit the `properties` list in `search.dart`:
      ```dart
      List<Map<String, dynamic>> properties = [
        {"id": 1, "name": "12mn \$", "lat": 37.7749, "lng": -122.4194},
        {"id": 2, "name": "11mn \$", "lat": 37.7849, "lng": -122.4494},
      ];
      ```

2. **Updating Map Styles**:
    - Replace the JSON file in `assets/json/dark_mode_style.json` with your custom map style from the Google Maps Styling Wizard.

3. **Custom Markers**:
    - Replace the `AnimatedContainer` implementation in `_generateMarkerIcon` with your desired widget.

4. **Adding Features**:
    - Use the modular structure to add new screens or features. For example, create a new module for user profiles in `modules/user/`.

---

### **Developer Tips**

1. Keep your code files **short and modular**:
    - Limit logic-heavy UI files to around **100 lines**.
    - Offload reusable components into their respective `widgets.dart`.

2. Use `debugPrint` for debugging:
   ```dart
   debugPrint("Marker tapped: ${property['name']}");
   ```

3. Test animations thoroughly:
    - Ensure smooth animations across devices with different hardware capabilities.

4. Follow Flutter’s [Widget Catalog](https://flutter.dev/docs/development/ui/widgets) for pre-built components to save time.

