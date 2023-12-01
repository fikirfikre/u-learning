part of 'courses_bloc.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();
  
  @override
  List<Object> get props => [];
}

final class CoursesInitial extends CoursesState {}
final class CoursesLoading extends CoursesState {}
final class CoursesLoaded extends CoursesState {
  final List<CourseEntity> courses;
  const CoursesLoaded({required this.courses});
}
final class CoursesErorr extends CoursesState {}