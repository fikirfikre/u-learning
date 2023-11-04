import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/data/models/course_model.dart';
import 'package:learning_app/domain/entity/user_entity.dart';

import '../../models/user_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<UserCredential> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<List<CourseModel>> fetchCourse();
  Future<UserModel> getUser(String id);
  Future<void> logout();
}