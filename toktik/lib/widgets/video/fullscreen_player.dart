
import 'package:flutter/material.dart';
import 'package:toktik/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';



class FullscreenPlayer extends StatefulWidget {


  final String videoUrl;

  final String caption;

  const FullscreenPlayer({super.key, required this.videoUrl, required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {

  //Widget.videoUrl way to access parameters of the FullscreenPlayer class

  late VideoPlayerController controller;//controller for the video player: pause, play...

  @override
  void initState() {//definition of the initial state of the widget
   
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)//construct the controller from an asset
         ..setVolume(0)//sets initial volume to 0
         ..setLooping(true)//infinite video repetition
         ..play();//start reproducing at the start     
  }

  
  @override
  void dispose() {
    
    controller.dispose();//keeps the video paused when no longer viewing 
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(), 
      builder: (context,snapshot) {
                if (snapshot.connectionState != ConnectionState.done){
                    return const Center(child: CircularProgressIndicator(),);//if not connected yet, show progress icon
                }

                return GestureDetector(
                  onTap:(){//if user taps screen and is playing 
                    if(controller.value.isPlaying){
                      controller.pause();//pause video
                      return;
                    }
                    controller.play();//if it is not playing, play it
                  },
                  child: AspectRatio(//widget with an aspect ratio
                    aspectRatio: controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        
                        VideoPlayer(controller),

                        VideoBackground(),
                        Positioned(
                          bottom: 50,
                          left:20,
                          child: _VideoCaption(caption: widget.caption,)
                          )
                      
                      ]
                      ),
                    ),
                );
                
      }
      );
  }
}


class _VideoCaption extends StatelessWidget {
  
  final String caption;
  
  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final titleStyle=Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width*0.6,
      child: Text(caption,maxLines:2, style:titleStyle)
    );
  }
}