import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(//providers makes information available for all widgets regardless of level in the widget tree structure
      providers: [
        ChangeNotifierProvider( create: (context) => ChatProvider() )//calls constructor method of provider, context is not used so can be witten as _
      ],
      child: MaterialApp(
        //theme from the implementation of app_theme.dart
        //method theme() returns a ThemeData which is what theme: recieves
        theme: AppTheme(selectedColor: 1).theme(),//defines the theme of the material app and passed in the context
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      
      ),
    );
  }
}

//just a screen with a click me button
class ClickmeScaffold extends StatelessWidget {
  const ClickmeScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: FilledButton.tonal(//.tonal is a lighter color
          onPressed:(){}, 
          child: const Text('click me') ),
      ),
    );
  }
}