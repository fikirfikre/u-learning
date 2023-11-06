import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable{
  final String videoId;
  final String titlte;
  final String url;
  final String thumbnailurl;
  // final String courseId;
  final String videoLength;

  const VideoEntity({
    required this.videoId,
    required this.titlte,
    required this.url,
    required this.thumbnailurl,
    // required this.courseId,
    required this.videoLength
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}