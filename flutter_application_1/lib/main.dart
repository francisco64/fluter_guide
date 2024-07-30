import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/counter/counter_screen.dart';
import 'package:flutter_application_1/presentation/screens/counter_functions_screen.dart';

void main(){
  
  //widget app
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
    const MyApp({super.key});//key is the idetifier for each widget

    
    @override
    Widget build(BuildContext context) {//build is the method called to create the app
      
    return MaterialApp(//const states that the app won't change so it is defined in a certain way in app construction
      
      debugShowCheckedModeBanner: false,//show debug flag
      home: const CounterFunctionsScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue
      ),
    );
  
  }

}