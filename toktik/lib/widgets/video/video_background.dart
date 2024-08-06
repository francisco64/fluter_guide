



import 'package:flutter/material.dart';


class VideoBackground extends StatelessWidget {
  
  final List<Color> colors;
  final List<double> stops;
  
  const VideoBackground({
    super.key, 
    this.colors=const [
      Colors.transparent,
      Colors.black
    ], this.stops=const [//stops of the gradient
      0.8,1
    ]});


  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            ),

        ),
      ),
    );
  }
}