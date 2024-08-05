import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //instances the provider when the app is created and not when it is called for the first time i.e context.watch (default)
          //helpful to load data rightaway
          lazy:false,
          //DiscoverProvider()..loadNextPage() is the cascade operator
          //equivalent to: 
          //DiscoverProvider() - instantiates the provider
          //DiscoverProvider().loadNextPage() - calls method loadNextPage()
          create: (context) => DiscoverProvider()..loadNextPage() 
          )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const Scaffold(
          //appBar: AppBar(
          //  title: const Text('Material App Bar'),
          //),
          body: Center(
            child: DiscoverScreen(),
          ),
        ),
      ),
    );
  }
}  