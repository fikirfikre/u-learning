import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/usecase/get_videos_usecase.dart';

import '../../../../domain/entity/video_entity.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final VideoUseCases videoUseCases;
  DetailBloc({required this.videoUseCases}) : super(DetailInitial()) {
    on<ContinueButtonPressed>((event, emit) async{
      emit(DetailLoading());
      final failureorvideos = await videoUseCases.getListOfVideo(event.courseId);
      failureorvideos.fold((video) => emit(DetailSuccess(videos: video)), (fail) => DetailError());
    });
  }
}
