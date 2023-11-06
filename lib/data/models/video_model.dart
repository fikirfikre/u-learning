import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/video_entity.dart';

class VideoModel extends VideoEntity with EquatableMixin {
  VideoModel(
      {
      required super.thumbnailurl,
      required super.titlte,
      required super.url,
      required super.videoId,
      required super.videoLength});

  factory VideoModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return VideoModel(
        
        thumbnailurl: json['thumbnail_url'],
        titlte: json["title"],
        url: json["url"],
        videoId: doc.id,
        videoLength: json["video-length"]);
  }
}
