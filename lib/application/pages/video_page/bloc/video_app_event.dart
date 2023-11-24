part of 'video_app_bloc.dart';

sealed class VideoAppEvent extends Equatable {
  const VideoAppEvent();

  @override
  List<Object> get props => [];
}
class initializeVideo extends VideoAppEvent {
  final String url;
  const initializeVideo({required this.url});
}
class PauseOrPlayEvent extends VideoAppEvent {
 
}
class VideoToggle extends VideoAppEvent{}
class VideoCompleted extends VideoAppEvent {
  final VideoPlayerController controller;
  const VideoCompleted({required this.controller});
}
class VideoHover extends VideoAppEvent {}
class VideoNotHover extends VideoAppEvent {}