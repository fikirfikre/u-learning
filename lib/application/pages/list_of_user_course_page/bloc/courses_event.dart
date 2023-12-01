part of 'courses_bloc.dart';

sealed class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];


}
class MyCoursesButtonClicked extends CoursesEvent{}
