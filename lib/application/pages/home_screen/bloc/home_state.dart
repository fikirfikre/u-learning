part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final List<CourseEntity> courses;
 const HomeSuccess({required this.courses});
}
final class HomeError extends HomeState {}
final class GetPopularSuccess extends HomeState{
  final List<CourseEntity> courses;
  GetPopularSuccess({required this.courses});
}