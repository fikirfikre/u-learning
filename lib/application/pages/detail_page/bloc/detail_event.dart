part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}
final class ContinueButtonPressed extends DetailEvent {
  final String courseId;
  ContinueButtonPressed({required this.courseId});
}