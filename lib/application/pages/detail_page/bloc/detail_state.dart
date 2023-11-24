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
  final bool isItPaid;
  DetailSuccess({required this.videos,required this.isItPaid});
}
final class DetailError extends DetailState {}
// final class Paid extends DetailState {
//    final List<VideoEntity> videos;
//    Paid({required this.videos});
// }
// final class NotPaid extends DetailState{
//    final List<VideoEntity> videos;
//    NotPaid({required this.videos});
// }