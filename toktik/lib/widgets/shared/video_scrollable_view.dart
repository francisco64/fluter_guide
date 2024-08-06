import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/widgets/shared/video_buttons.dart';
import 'package:toktik/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  
  final List<VideoPost> videos;
  
  
  const VideoScrollableView({super.key, required this.videos});


  @override
  Widget build(BuildContext context) {
    return PageView.builder(//show different views and allows scrolling between them
      //builder states how to build the widgets to not load all widgets in memory 
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),//if scroll to limit
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(//puts one widget on top of the other towards user's face
          children: [
            //video player + gradiente
            SizedBox.expand(//vs expanded?
              child: FullscreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption,),
            ),

            //floating buttons
            Positioned(
              bottom:40,
              right: 20,
              child: VideoButtons(video: videoPost)
            )
          ],
        );

      }

      /*
      if only PageView instead of PageView.builder 
      children: 
      [
        Container(color: Colors.red,),
        Container(color: Colors.blue,),  
      ],
      */
    );
  }
}