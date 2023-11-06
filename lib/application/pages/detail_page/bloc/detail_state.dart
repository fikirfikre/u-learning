part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}
final class DetailLoading extends DetailState {}
final class DetailSuccess extends DetailState {
  final List<VideoEntity> videos;
  DetailSuccess({required this.videos});
}
final class DetailError extends DetailState {}