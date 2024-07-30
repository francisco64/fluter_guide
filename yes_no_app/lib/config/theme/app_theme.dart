import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 53, 204, 196);
const List<Color> _colorThemes =  [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme{
  //class does not need a constructor method because there are no variables to instantiate
  
  final int selectedColor;

  AppTheme({required this.selectedColor}):
    assert(selectedColor >=0 && selectedColor < _colorThemes.length,'Colors must be between 0 and ${_colorThemes.length-1}');

  ThemeData theme (){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}