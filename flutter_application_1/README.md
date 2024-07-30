# Flutter Counter App - Project Notebook

## Overview

This project is a simple Flutter application that demonstrates fundamental concepts and widgets of Flutter through a counter application. The application allows users to increment and reset a counter. It includes a main screen with buttons to interact with the counter and demonstrates state management in Flutter.

## Key Concepts and Widgets

### main.dart

- **MyApp Class**: The root widget of the application.
- **MaterialApp Widget**: Configures the app-wide theme and sets the home screen.


#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `runApp()`                     | Bootstraps the Flutter application.                                                          | [runApp](https://api.flutter.dev/flutter/widgets/runApp.html) |
| `StatelessWidget`              | A widget that does not require mutable state.                                                | [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html) |
| `MaterialApp`                  | A convenience widget that wraps a number of widgets commonly required for applications.      | [MaterialApp](https://api.flutter.dev/flutter/material/MaterialApp-class.html) |
| `ThemeData`                    | Defines the theme data for the application.                                                  | [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html) |
| `ColorSchemeSeed`              | Seeds the color scheme for the application.                                                  | [ColorSchemeSeed](https://api.flutter.dev/flutter/material/ThemeData/colorSchemeSeed.html) |

### counter_functions_screen.dart

- **StatefulWidget**: Demonstrates state management with a counter app.
- **Scaffold Widget**: Provides a structure for the visual interface.
- **AppBar Widget**: Displays the title and actions for the screen.
- **FloatingActionButton Widget**: Used for incrementing, decrementing, and resetting the counter.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `StatefulWidget`               | A widget that has mutable state.                                                             | [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) |
| `createState()`                | Creates the mutable state for this widget.                                                   | [createState](https://api.flutter.dev/flutter/widgets/StatefulWidget/createState.html) |
| `Scaffold`                     | Implements the basic material design visual layout structure.                                | [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) |
| `AppBar`                       | A material design app bar.                                                                   | [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) |
| `FloatingActionButton`         | A circular button that hovers over content to promote a primary action in the application.   | [FloatingActionButton](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html) |
| `setState()`                   | Notifies the framework that the internal state of this object has changed.                   | [setState](https://api.flutter.dev/flutter/widgets/State/setState.html) |

### counter_screen.dart

- Similar to `counter_functions_screen.dart` but with a simplified counter increment functionality.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `StatefulWidget`               | A widget that has mutable state.                                                             | [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) |
| `createState()`                | Creates the mutable state for this widget.                                                   | [createState](https://api.flutter.dev/flutter/widgets/StatefulWidget/createState.html) |
| `Scaffold`                     | Implements the basic material design visual layout structure.                                | [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) |
| `AppBar`                       | A material design app bar.                                                                   | [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) |
| `FloatingActionButton`         | A circular button that hovers over content to promote a primary action in the application.   | [FloatingActionButton](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html) |
| `setState()`                   | Notifies the framework that the internal state of this object has changed.                   | [setState](https://api.flutter.dev/flutter/widgets/State/setState.html) |

## Custom Widgets

### CustomFloatingButton

A reusable floating action button with customizable icon and behavior.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `StatelessWidget`              | A widget that does not require mutable state.                                                | [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html) |
| `FloatingActionButton`         | A circular button that hovers over content to promote a primary action in the application.   | [FloatingActionButton](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html) |
| `Icon`                         | A graphical icon widget drawn with a glyph from a font described in an `IconData` object.    | [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html) |

## Key Concepts

### State Management

In this project, state management is handled using `StatefulWidget` and `setState()` method. The `setState()` method is used to notify the framework that the internal state has changed, causing the widget to rebuild.

### Theming

The application uses `ThemeData` to apply a consistent theme across the app. The `colorSchemeSeed` is used to seed the color scheme for the application.

### Layout

The `Scaffold` widget is used to create the basic layout of the app, including the `AppBar` and the body. The `Column` widget is used to arrange the children widgets vertically.

### Widgets

Several core widgets are used, including `Text`, `Icon`, and `FloatingActionButton`, each demonstrating different aspects of Flutter's widget system.


## References

For more information on the widgets and methods used in this project, refer to the [Flutter documentation](https://flutter.dev/docs).

---

This notebook serves as a quick reference guide for the concepts implemented in the project. Review it whenever you need to recall specific details about the project structure or Flutter concepts.
