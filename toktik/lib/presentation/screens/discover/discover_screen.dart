import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final discoverProvider = context.watch<DiscoverProvider>();

    final otroProvider = Provider.of<DiscoverProvider>(context);//simillar to above


    return Scaffold(
      body: discoverProvider.initialLoading //if true show loading widget  
      ? const Center(child: CircularProgressIndicator()) 
      : VideoScrollableView(videos: discoverProvider.videos,)//when videos are loaded initial loading turns false and shows this
    );
  }
}