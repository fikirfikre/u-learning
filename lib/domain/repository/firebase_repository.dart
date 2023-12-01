import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/domain/entity/course_entity.dart';
import 'package:learning_app/domain/entity/user_entity.dart';
import 'package:learning_app/domain/entity/video_entity.dart';
import 'package:learning_app/domain/failure/failure.dart';

abstract class FirebaseRepository{

  Future<Either<UserCredential,Failure>> signIn(UserEntity user);
  Future<Either<void,Failure>> signUp(UserEntity user);
  Future<Either<List<CourseEntity>,Failure>> getCourses();
  Future<Either<UserEntity,Failure>> getUser(String id);
  Future<Either<void,Failure>> logout();
  Future<Either<List<VideoEntity>, Failure>> getListOfVideo(String courseId);
  Future<Either<void,Failure>> addCourseToUserList(String courseId);
  Future<Either<bool,Failure>> isTheUserPain(String courseId);
  Future<Either<List<CourseEntity>,Failure>> getUserCourses();
  
}