part of 'video_app_bloc.dart';

sealed class VideoAppPlayerState extends Equatable {
  const VideoAppPlayerState();

  @override
  List<Object> get props => [];

  get controller => null;
}

final class VideoAppInitial extends VideoAppPlayerState {}

class VideoAppLoading extends VideoAppPlayerState {}

class VideoAppSuccess extends VideoAppPlayerState {
  @override
  final VideoPlayerController controller;
  const VideoAppSuccess({required this.controller});
}

class VideoAppError extends VideoAppPlayerState {}
class VideoStopped extends VideoAppPlayerState {
  @override
  final VideoPlayerController controller;
  const VideoStopped({required this.controller});
}
class VideoPlaying extends VideoAppPlayerState {
  @override
  final VideoPlayerController controller;
  const VideoPlaying({required this.controller});
}
class HideVideoBar extends VideoAppPlayerState{
   final VideoPlayerController controller;
  HideVideoBar({required this.controller});
}
class ShowVideoBar extends VideoAppPlayerState{
  final VideoPlayerController controller;
  ShowVideoBar({required this.controller});
}
