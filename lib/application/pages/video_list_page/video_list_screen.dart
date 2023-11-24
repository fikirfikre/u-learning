import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_app/application/pages/detail_page/detail_screen.dart';
import 'package:learning_app/application/pages/video_page/video_play_screen.dart';
import 'package:learning_app/domain/entity/video_entity.dart';
import 'package:video_player/video_player.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key,required this.videos});
  final List<VideoEntity> videos;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (contex,index){
           return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>VideoApp(url:videos[index].url ,)));
            }, 
            child: VideoCard(videos: videos, i: index));
        }),
    );
  }
}