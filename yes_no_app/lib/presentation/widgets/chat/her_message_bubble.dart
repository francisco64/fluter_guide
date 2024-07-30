import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});
  

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;//Theme is defined in material and is part of the context

    //colors.primay (primary color), error (color if error), inversePrimary (of primary)

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,//alignment along X axis
      //mainAxisAlignment: , along Y axis
      children: [
      Container(
        //this widget is just a white space that can contain another widget
        //height: 10,
        //width: 10,
        decoration: BoxDecoration(
          color: colors.inversePrimary,//color defined in the theme of Material 
          borderRadius: BorderRadius.circular(20),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Hola Mundo',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      const SizedBox(height: 5,),

      _ImageBubble()

    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;//device size


    return ClipRRect(//rounds borders of child
      borderRadius: BorderRadius.circular(30),
      child: Image.network(//returns an image widget, unlike NetworkImage that returns an object
        'https://yesno.wtf/assets/no/23-5fe6c1ca6c78e7bf9a7cf43e406fb8db.gif',
        width: size.width*0.5,//to make it depend on the width of the device
        height: 150,
        fit: BoxFit.cover,//adjusts pixel ratio
        loadingBuilder: (context, child, loadingProgress) {
          
          if (loadingProgress==null) return child;//if loaded return image (child)

          return Padding(
            padding: const EdgeInsets.all(50.0),//padding makes the circle less close 
            child: CircularProgressIndicator(//widget that shows a progress circle until image is fully loaded
              strokeAlign: 0,
              strokeWidth: 3,
              
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
          );
          /*
          return Container(
            width: size.width*0.5,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal:10,vertical:5),
            child: Text('Cargando imagen'),
            
          );
          */
        },
        ),
    );
  }
}