import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  //stateless does not change if counter is to be modified has to be changed to be a stateful
  //if stateless it does now allow to modify parameters of the class(widget)
  const CounterFunctionsScreen({super.key});

  @override //builds method createState that returns the current state(widget)
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //scaffold implements a basic material design
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(97, 13, 182, 255),
            title: const Text('Counter Functions Screen'),
            actions: [
              //multiple nuttons in the appbar
              IconButton(
                icon: const Icon(Icons.refresh_rounded), //cycle icon
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                },
              ), // refresh counter
              IconButton(
                icon: const Icon(Icons.add_a_photo), //cycle icon
                onPressed: () {},
              )
            ]
            /* leading: IconButton(//only one button in the appbar
            icon: Icon(Icons.refresh_rounded), //cycle icon
            onPressed: () {  },
          ),
          */

            ),
        body: Center(
          //center of child i.e columns
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //center of rows
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(clickCounter == 1 ? 'Click' : 'Clicks',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100))
            ],
          ),
        ), //Center(child:Text('Counter Screen'))//in the body we specify a text centered
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatingButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                clickCounter=0;
                setState(() {});
              },
              ),

            const SizedBox(height: 10,), //space between widgets
            // ignore: prefer_const_constructors
            CustomFloatingButton(
              icon: Icons.plus_one_outlined,
              onPressed: () {
                clickCounter++;
                setState(() {});
              }  ,),
            
            const SizedBox(height: 10,), //space between widgets

            CustomFloatingButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                if (clickCounter==0) return;//if it is 0 returns and does not run the remaining code
                clickCounter--;//modiffies the app, can do within setState
                setState(() {});//sets the state after modified
              })
          ],
        ));
  }
}

class CustomFloatingButton extends StatelessWidget {
  
  final IconData icon;

  //to pass a void function as parameter of the constructor
  final VoidCallback? onPressed;//? can be null

  const CustomFloatingButton({
    super.key, 
    required this.icon, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),//rounded shape of the icon
      onPressed: onPressed,
      child: Icon(icon),
      backgroundColor: Colors.white,
    );
  }
}
