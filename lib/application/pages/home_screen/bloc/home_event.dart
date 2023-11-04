part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}
final class HomeEvents extends HomeEvent {}
// final class AllButtonPressed extends HomeEvent{}
// final class PopularButtonPressed extends HomeEvent{}
// final class NewestButtonPressed extends HomeEvent {}