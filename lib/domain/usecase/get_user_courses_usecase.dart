import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/repository/firebase_repository.dart';

import '../entity/course_entity.dart';
import '../failure/failure.dart';

class GetUserCourseUsecase {
  final FirebaseRepository firebaseRepository;
  GetUserCourseUsecase({required this.firebaseRepository});
  Future<Either<List<CourseEntity>,Failure>> getUserCourses(){
    return firebaseRepository.getUserCourses();
  
  }
}