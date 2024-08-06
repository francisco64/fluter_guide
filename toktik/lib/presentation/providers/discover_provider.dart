


import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  //TODO : Repository, DataSOurce



  bool initialLoading =true;

  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {//loading next page is adding an element to the videos list which changes the state
    
    //await Future.delayed(const Duration(seconds:2));// simulates http request loading



    //videoPosts is a list of json objects, 
    //lists have map method to map a given function to each element of the list
    //each element is a json so a LocalVideoModel is created through a fromJsonMap constructor method
    //to make the LocalVideoModel a VideoPost object the toVideoPostEntity available in the LocalVideoModel is used 
    //a map method returns an iterable so a .toList method is used 
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
      ).toList();

    videos.addAll(newVideos);//add all elements of one list to another
    initialLoading=false;
    
    
    notifyListeners();
  }
  
}