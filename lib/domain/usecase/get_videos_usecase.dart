import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/entity/video_entity.dart';
import 'package:learning_app/domain/failure/failure.dart';

import '../repository/firebase_repository.dart';

class VideoUseCases {
  final FirebaseRepository firebaseRepository;

  VideoUseCases({required this.firebaseRepository});
  Future<Either<List<VideoEntity>,Failure>> getListOfVideo(String courseId){
    return  firebaseRepository.getListOfVideo(courseId);
  }

  Future<Either<bool,Failure>> isTheUserPaid(String courseId){
return firebaseRepository.isTheUserPain(courseId);
  }
}