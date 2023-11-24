import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_app_event.dart';
part 'video_app_state.dart';

class VideoAppBloc extends Bloc<VideoAppEvent, VideoAppPlayerState> {
  late VideoPlayerController controller;
  late bool isHovered;
  VideoAppBloc() : super(VideoAppLoading()) {
    on<initializeVideo>(_onVideoLoading);
    on<VideoToggle>(_onVideoToggle);
    on<VideoCompleted>(_onVideoCompeleted);
    on<VideoHover>(_onVideoHover);
    on<VideoNotHover>(_onVideoNotHover);
  }

  void _onVideoLoading(initializeVideo event, Emitter emit) async {
    emit(VideoAppLoading());
    try {
      controller = VideoPlayerController.network(
         event.url);

      await controller.initialize().then((value) => null);
      emit(VideoAppSuccess(controller: controller));

      controller.addListener(() {
        if (controller.value.isInitialized &&
            controller.value.position == controller.value.duration) {
          print("completed");
          add(VideoCompleted(controller: controller));
        }
      });
    } catch (e) {
      emit(VideoAppError());
    }
  }

  void _onVideoToggle(VideoToggle event, Emitter emit) async {
    if (controller.value.isPlaying) {
      await controller.pause();
      emit(VideoStopped(controller: controller));
    } else {
      await controller.play();
      emit(VideoPlaying(controller: controller));
    }
  }

  void _onVideoCompeleted(VideoCompleted event, Emitter emit) async {
    await controller.seekTo(Duration.zero);
    await controller.pause();
    emit(VideoAppSuccess(controller: controller));
  }

  void _onVideoHover(VideoHover event, Emitter emit) {
    emit(ShowVideoBar(controller: controller));
  }

  void _onVideoNotHover(VideoNotHover event, Emitter emit) {
    emit(HideVideoBar(controller: controller));
  }
}
