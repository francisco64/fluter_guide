import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;//i need this to know how many likes, etc...

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     _CustomIconButton(
      value: video.likes, 
      iconData: Icons.favorite, 
      color: Colors.red,),
      _CustomIconButton(
        value: video.views, 
        iconData: Icons.remove_red_eye_outlined, 
      )
     ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  
  final int value;
  final IconData iconData;
  final Color? color;
  
  
  const _CustomIconButton({
    super.key, 
    required this.value, 
    required this.iconData, 
    this.color=Colors.white}
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){}, icon: Icon (iconData, color: color,size: 30,)),
        Text(HumanFormats.humanReadableNumber(value.toDouble()))
      ]
    );
  }
}