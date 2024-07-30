import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(//underline has only one line at the button, outline is on the whole shape
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );


    //controls text in the form i.e clear field, get text...
    final textController = TextEditingController();
    final focusNode = FocusNode();//checks and controls focus either keyboard or screen
    return TextFormField(//widget for text input
      focusNode: focusNode ,
      controller: textController,
      onFieldSubmitted: (value) { 
        print('submitted value $value');//prints value if done button is pressed
        //textController.clear();//clears text written by user
        },
      onChanged: (value) {print('submitted value $value');},//prints the whole text if the text changes
      //if user taps outside the form go to the screen,
      onTapOutside: (event) { focusNode.unfocus(); },//without this taps on the screen dont take to the screen 

      decoration: InputDecoration(//form style
        //border: outlineInputBorder,//all borders
        enabledBorder: outlineInputBorder,//when showing the whole screen
        focusedBorder: outlineInputBorder,//when showing keyboard
        hintText: 'Escribe Algo',
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          enableFeedback: true,
          onPressed: () {
            final textValue = textController.value.text;//gets user input from the controller
            print('button: $textValue'); 
            textController.clear(); 
          },
          ),
      ),

    );
  }
}