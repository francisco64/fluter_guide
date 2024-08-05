

import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel{
  final String name;//as per the http request5
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
    this.likes=0, 
    this.views=0
  });


  factory LocalVideoModel.fromJsonMap(Map<String,dynamic> json) => 
  LocalVideoModel(
    name: json['name'] ?? 'no name',//if null then write no name
    videoUrl: json['videoUrl'],
    likes: json['likes'],
    views: json['views'],

  );

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views,
  );





}