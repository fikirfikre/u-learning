part of 'button_pressed_bloc.dart';

sealed class ButtonPressedState extends Equatable {
  const ButtonPressedState();
  
  @override
  List<Object> get props => [];
}

final class GetAllState extends ButtonPressedState {
  // final List<CourseEntity> coures;
  GetAllState();
}

final class GetAllPopularState extends ButtonPressedState{
  final List<CourseEntity> courses;
  GetAllPopularState({required this.courses});
}