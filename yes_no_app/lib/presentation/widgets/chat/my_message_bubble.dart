import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  
  final Message message;
  const MyMessageBubble({super.key,required this.message});
  

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;//Theme is defined in material and is part of the context

    //colors.primay (primary color), error (color if error), inversePrimary (of primary)

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,//alignment along X axis
      //mainAxisAlignment: , along Y axis
      children: [
      Container(
        //this widget is just a white space that can contain another widget
        //height: 10,
        //width: 10,
        decoration: BoxDecoration(
          color: colors.primary,//color defined in the theme of Material 
          borderRadius: BorderRadius.circular(20),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(height: 10,)
    ]);
  }
}
