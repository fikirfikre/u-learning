import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/entity/course_entity.dart';
import 'package:learning_app/domain/repository/firebase_repository.dart';

import '../failure/failure.dart';

class CoursesUseCases{
  final FirebaseRepository firebaseRepository;
  CoursesUseCases({required this.firebaseRepository});

  Future<Either<List<CourseEntity>,Failure>> fetchCourse(){
     return firebaseRepository.getCourses();
  }
}