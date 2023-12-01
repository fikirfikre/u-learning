import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/video_page/bloc/video_app_bloc.dart';
import 'package:learning_app/domain/entity/video_entity.dart';
import 'package:video_player/video_player.dart';

import '../detail_page/detail_screen.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key,required this.url,required this.videos, required this.selectedVideo});
  final String url;
  final List<VideoEntity> videos;
  final int selectedVideo;
  @override
  VideoAppState createState() => VideoAppState();
}

class VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  bool _showPlayArrow = true;
  bool _hideVideoBar = true;

  @override
  void initState() {
    super.initState();
  
    BlocProvider.of<VideoAppBloc>(context).add(initializeVideo(url:widget.url));

  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      
      appBar: AppBar(
        title:const Text("Lessons",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.w900,fontSize: 28),),
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.amber,)),
      ),
      body: BlocBuilder<VideoAppBloc, VideoAppPlayerState>(
        builder: (context, state) {
          if (state is VideoAppSuccess ||
              state is VideoStopped ||
              state is VideoPlaying) {
            return SingleChildScrollView(
                child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
                      child: Column(
                        children: [
                          Stack(
                              alignment: _showPlayArrow
                                  ? Alignment.center
                                  : Alignment.bottomLeft,
                              children: [
                                AspectRatio(
                                    aspectRatio: state.controller.value.aspectRatio,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _hideVideoBar = !_hideVideoBar;
                                            print(_hideVideoBar);
                                          });
                                        },
                                        child: VideoPlayer(state.controller))),
                                Visibility(
                                    visible: _showPlayArrow,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showPlayArrow = false;
                    
                                          state.controller.play();
                                        });
                                      },
                                    )),
                                Visibility(
                                  visible: !_hideVideoBar,
                                  child: Visibility(
                                      visible: !_showPlayArrow,
                                      child: Container(
                                        height: 60,
                                        color: Colors.black.withOpacity(0.5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: VideoProgressIndicator(
                                                  state.controller,
                                                  allowScrubbing: true),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.arrow_left_rounded,
                                                      color: Colors.white,
                                                      size: 30,
                                                    )),
                                                  if(state is! VideoAppSuccess)...{
                                                IconButton(
                                                  onPressed: () {
                                                    print(state
                                                        .controller.value.isPlaying);
                                                    context
                                                        .read<VideoAppBloc>()
                                                        .add(VideoToggle());
                                                  },
                                                  icon: Icon(
                                                    state is VideoPlaying
                                                        ? Icons.pause
                                                        : Icons.play_arrow,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                  },
                                                if(state is VideoAppSuccess)...{
                                                      IconButton(
                                                  onPressed: () {
                                                    print(state
                                                        .controller.value.isPlaying);
                                                    context
                                                        .read<VideoAppBloc>()
                                                        .add(VideoToggle());
                                                  },
                                                  icon:state.controller.value.isPlaying?
                                                 const  Icon(
                                                   
                                                        Icons.pause,
                                                        
                                                    color: Colors.white,
                                                    size: 30,
                                                  ):  const Icon(
                                                   
                                                        Icons.play_arrow,
                                                        
                                                    color: Colors.white,
                                                    size: 30,
                                                  ) ,
                                                ),
                                                },
                                                IconButton(
                                                    onPressed: () {},
                                                    icon:const Icon(
                                                      Icons.arrow_right_rounded,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            for (var i = 0; i < widget.videos.length; i++) ...{
                                
                                VideoCard(videos: widget.videos, i: i,isSelected:i==widget.selectedVideo)
        }
                        ],
                      ),
                      
                    )
                    );
          } else if(state is VideoAppLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.amber,));
          }else{
            return const Center(child:Text("Something wrong"));
          }
        },
      ),
    );
  }
}
