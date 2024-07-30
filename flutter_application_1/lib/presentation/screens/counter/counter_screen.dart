import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  //stateless does not change if counter is to be modified has to be changed to be a stateful 
  //if stateless it does now allow to modify parameters of the class(widget) 
  const CounterScreen({super.key});

  @override//builds method createState that returns the current state(widget)
  State<CounterScreen> createState() => _CounterScreenState();
}




class _CounterScreenState extends State<CounterScreen> {

  int clickCounter=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(//scaffold implements a basic material design
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(97, 13, 182, 255),
          title: const Text('Counter Screen'),
        ),
        body: Center(//center of child i.e columns
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//center of rows
            children:[
              Text('$clickCounter',style: const TextStyle(fontSize: 160,fontWeight: FontWeight.w100),),
              Text(clickCounter == 1 ? 'Click':'Clicks' ,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w100))],
          ),
        ),//Center(child:Text('Counter Screen'))//in the body we specify a text centered
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            clickCounter++;//modiffies the app, can do within setState
            setState(() {});//sets the state after modified 
            } ,//function to run on pressed, void function
          child: const Icon(Icons.plus_one),
          ),
        );
  }
}
