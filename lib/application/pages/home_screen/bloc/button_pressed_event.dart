part of 'button_pressed_bloc.dart';

sealed class ButtonPressedEvent extends Equatable {
  const ButtonPressedEvent();

  @override
  List<Object> get props => [];
}
final class AllButtonPressed extends ButtonPressedEvent{}
final class PopularButtonPressed extends ButtonPressedEvent {
  List<CourseEntity> courses;
  PopularButtonPressed({required this.courses});
}
final class NewestButtonPressed extends ButtonPressedEvent {}
