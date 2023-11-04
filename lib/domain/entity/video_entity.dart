import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable{
  final String videoId;
  final String titlte;
  final String url;
  final String thumbnailurl;
  final String courseId;

  const VideoEntity({
    required this.videoId,
    required this.titlte,
    required this.url,
    required this.thumbnailurl,
    required this.courseId
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}