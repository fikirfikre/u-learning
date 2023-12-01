import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/usecase/get_user_courses_usecase.dart';

import '../../../../domain/entity/course_entity.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final GetUserCourseUsecase getUserCourseUsecase;
  CoursesBloc({required this.getUserCourseUsecase}) : super(CoursesInitial()) {
    on<MyCoursesButtonClicked>(_buttonclicked);
  }

  void _buttonclicked(CoursesEvent event,Emitter emit) async{
    emit(CoursesLoading());
     final failureOrResult = await getUserCourseUsecase.getUserCourses();
     failureOrResult.fold((courses) => emit(CoursesLoaded(courses: courses)), (error) => emit(CoursesErorr()));
  }
}
