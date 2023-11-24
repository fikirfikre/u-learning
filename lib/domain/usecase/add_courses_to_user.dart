import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/failure/failure.dart';
import 'package:learning_app/domain/repository/firebase_repository.dart';

class AddCourseToUserList {
  final FirebaseRepository firebaseRepository;
  AddCourseToUserList({required this.firebaseRepository});
  Future<Either<void,Failure>> addCourseToUserList(courseId) async{
   return  await firebaseRepository.addCourseToUserList(courseId);
  }
}