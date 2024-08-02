
## Key Concepts and Widgets
<img src="https://github.com/francisco64/flutter_guide/blob/main/yes_no_app/readme_images/simulator_screenshot_3ADAF09C-2766-41ED-A036-A4F418E26EDA.png" alt="drawing" width="200"/>

### main.dart

- **MyApp Class**: The root widget of the application, utilizing `MultiProvider` for state management.
- **MaterialApp Widget**: Configures the app-wide theme and sets the home screen.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `runApp()`                     | Bootstraps the Flutter application.                                                          | [runApp](https://api.flutter.dev/flutter/widgets/runApp.html) |
| `MultiProvider`                | Makes multiple providers available to all widgets.                                           | [MultiProvider](https://pub.dev/documentation/provider/latest/provider/MultiProvider-class.html) |
| `ChangeNotifierProvider`       | Provides an instance of a class that extends `ChangeNotifier` to its descendants.            | [ChangeNotifierProvider](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html) |
| `MaterialApp`                  | A convenience widget that wraps a number of widgets commonly required for applications.      | [MaterialApp](https://api.flutter.dev/flutter/material/MaterialApp-class.html) |
| `ThemeData`                    | Defines the theme data for the application.                                                  | [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html) |

### chat_screen.dart

- **ChatScreen Class**: The main screen displaying the chat interface.
- **Scaffold Widget**: Provides a structure for the visual interface.
- **ListView.builder**: Builds a scrollable, linear array of widgets that are created on demand.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `Scaffold`                     | Implements the basic material design visual layout structure.                                | [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) |
| `AppBar`                       | A material design app bar.                                                                   | [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) |
| `ListView.builder`             | Creates a scrollable, linear array of widgets that are created on demand.                    | [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html) |
| `SafeArea`                     | Pads its child by sufficient padding to avoid intrusions by the operating system.            | [SafeArea](https://api.flutter.dev/flutter/widgets/SafeArea-class.html) |

### message_field_box.dart

- **MessageFieldBox Class**: A custom widget for inputting and sending messages.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `TextFormField`                | A material design text field.                                                                | [TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html) |
| `TextEditingController`        | Controls the text being edited.                                                              | [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html) |
| `FocusNode`                    | Manages the focus for a widget.                                                              | [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html) |
| `InputDecoration`              | Used to define the appearance of a text field.                                               | [InputDecoration](https://api.flutter.dev/flutter/material/InputDecoration-class.html) |

### my_message_bubble.dart & her_message_bubble.dart

- **MyMessageBubble Class**: Displays a message bubble for the current user.
- **HerMessageBubble Class**: Displays a message bubble for the other user.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `Container`                    | A convenience widget that combines common painting, positioning, and sizing widgets.         | [Container](https://api.flutter.dev/flutter/widgets/Container-class.html) |
| `BoxDecoration`                | A description of how to paint a box.                                                         | [BoxDecoration](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html) |
| `Padding`                      | Insets its child by the given padding.                                                       | [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html) |
| `Text`                         | A run of text with a single style.                                                           | [Text](https://api.flutter.dev/flutter/widgets/Text-class.html) |

### chat_provider.dart

- **ChatProvider Class**: Manages the state of the chat, including the list of messages and the scroll controller.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `ChangeNotifier`               | A class that can be extended or mixed in that provides a change notification API.            | [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) |
| `ScrollController`             | Controls a scrollable widget.                                                                | [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html) |
| `Future<void>`                 | Represents a potential value or error that will be available at some time in the future.     | [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) |

## Provider and State Management

In this project, we use the Provider package for state management. Provider helps manage and share state across the application efficiently. Below is a detailed explanation of the key concepts, methods, and their roles in the project.

### What is Provider?

Provider is a recommended way to manage state in Flutter applications. It allows you to share data between widgets seamlessly without the need to pass data through constructors or manually manage dependencies.

### Key Concepts and Methods

#### ChangeNotifier

`ChangeNotifier` is a simple way to manage state. It provides the `notifyListeners` method to notify all the listeners whenever there's a change in the state.

#### ChangeNotifierProvider

`ChangeNotifierProvider` is a widget that provides an instance of a class that extends `ChangeNotifier` to its descendants. It listens to changes in the `ChangeNotifier` and rebuilds the widgets that depend on it.

(start of dart code)
ChangeNotifierProvider(
  create: (context) => ChatProvider(),
)
(end of dart code)

#### context.watch

`context.watch` is a method provided by Provider that allows a widget to listen to changes in the provided class. When the provided class changes, the widget rebuilds.

(start of dart code)
final chatProvider = context.watch<ChatProvider>();
(end of dart code)

### ChatProvider Class

The `ChatProvider` class extends `ChangeNotifier` and manages the state of the chat, including the list of messages and the scroll controller. It has methods to send messages, handle replies, and scroll to the bottom of the chat.

#### Key Methods in ChatProvider

| Method                | Description                                                                                             |
|-----------------------|---------------------------------------------------------------------------------------------------------|
| `sendMessage(String text)` | Adds a new message to the list and notifies listeners. If the message ends with a '?', it triggers a reply. |
| `herReplay()`         | Simulates a reply from the other user by adding a new message to the list and notifies listeners.        |
| `moveScrollToBottom()`| Scrolls the chat view to the bottom when a new message is added.                                         |

#### sendMessage Method

This method handles adding a new message to the chat. If the message ends with a '?', it triggers a reply from the other user.

(start of dart code)
Future<void> sendMessage(String text) async {
  if (text.isEmpty) return;

  final newMessage = Message(text: text, fromWho: FromWho.me);
  messageList.add(newMessage);
  notifyListeners();
  moveScrollToBottom();

  if (text.endsWith('?')) {
    herReplay();
  }
}
(end of dart code)

#### herReplay Method

This method simulates a reply by fetching a response from the YesNo API and adding it to the message list.

(start of dart code)
Future<void> herReplay() async {
  final Message herMessage = await getYesNoAnswer.getAnswer();
  messageList.add(herMessage);
  notifyListeners();
  moveScrollToBottom();
}
(end of dart code)

### Scroll Management

The `moveScrollToBottom` method ensures the chat view scrolls to the latest message whenever a new message is added.

(start of dart code)
Future<void> moveScrollToBottom() async {
  await Future.delayed(const Duration(milliseconds: 100));
  chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}
(end of dart code)

### Summary Table

| Concept/Method               | Description                                                                                             | Reference URL                                     |
|------------------------------|---------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| `ChangeNotifier`             | A class that provides change notifications to listeners.                                                | [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) |
| `ChangeNotifierProvider`     | Provides an instance of a class that extends `ChangeNotifier` to its descendants.                        | [ChangeNotifierProvider](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html) |
| `context.watch`              | Listens to changes in the provided class and rebuilds the widget.                                        | [context.watch](https://pub.dev/documentation/provider/latest/provider/ProviderExtension-watch.html) |
| `sendMessage`                | Adds a new message to the list and notifies listeners.                                                   | -                                                 |
| `herReplay`                  | Simulates a reply from the other user by adding a new message to the list and notifies listeners.        | -                                                 |
| `moveScrollToBottom`         | Scrolls the chat view to the bottom when a new message is added.                                         | -                                                 |

Using Provider and ChangeNotifier for state management in Flutter simplifies the process of managing and sharing state across the application. It makes the code more readable and maintainable by decoupling state management from the UI.

For more information on Provider and state management in Flutter, refer to the [Provider documentation](https://pub.dev/packages/provider).


### yes_no_model.dart

- **YesNoModel Class**: Maps JSON response from the API to Dart objects and converts them to `Message` entities.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `factory constructor`          | A constructor that can return different instances based on logic.                           | [factory constructor](https://dart.dev/guides/language/language-tour#factories) |

### app_theme.dart

- **AppTheme Class**: Defines the custom theme for the application.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `ThemeData`                    | Defines the theme data for the application.                                                  | [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html) |

### get_yes_no_answer.dart

- **GetYesNoAnswer Class**: Makes network requests to the YesNo API and returns the response as a `Message`.

#### Key Methods and Widgets

| Method/Widget                  | Description                                                                                  | Reference URL                                      |
|--------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------|
| `Dio`                          | A powerful HTTP client for Dart, which supports interceptors, global configuration, and more.| [Dio](https://pub.dev/packages/dio) |
| `Future`                       | Represents a potential value or error that will be available at some time in the future.     | [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) |

## Key Concepts

### State Management

This project uses the Provider package for state management. The `ChangeNotifier` class is extended to create a `ChatProvider` which manages the list of messages and the scroll controller. 

### Asynchronous Programming

Asynchronous programming is used to handle network requests without blocking the main thread. The `Future` class represents a potential value or error that will be available at some time in the future.

### Theming

The application uses `ThemeData` to apply a consistent theme across the app. Custom colors are defined in `app_theme.dart`.

### Widgets

Several core widgets are used, including `Text`, `Container`, and `ListView.builder`, each demonstrating different aspects of Flutter's widget system.

<img src="https://github.com/francisco64/flutter_guide/blob/main/yes_no_app/readme_images/Screenshot%202024-07-31%20at%204.53.04%E2%80%AFPM.png" alt="drawing" width="400"/>

## References

For more information on the widgets and methods used in this project, refer to the [Flutter documentation](https://flutter.dev/docs).

---

This notebook serves as a quick reference guide for the concepts implemented in the project. Review it whenever you need to recall specific details about the project structure or Flutter concepts.
