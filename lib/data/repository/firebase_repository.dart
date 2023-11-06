import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/data/Exception/exception.dart';
import 'package:learning_app/data/datasource/remote_datasource/firebase_remote_datasource.dart';

import '../../domain/entity/course_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/entity/video_entity.dart';
import '../../domain/failure/failure.dart';
import '../../domain/repository/firebase_repository.dart';



class FirebaseRepositoryImpl implements FirebaseRepository{
  final FirebaseRemoteDataSource firebaseRemoteDataSource;
  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});
  @override
  Future<Either<UserCredential,Failure>> signIn(UserEntity user) async{
      try {
       final  result = await firebaseRemoteDataSource.signIn(user);
          return left(result);
      } on InvalidEmailException catch (_){
        return right(InvalidFailure(errorMessage:_.errorMessage ));
      }
      catch (e) {
         return right(GeneralFailure());
      }
      
  }
  
  @override
  Future<Either<void, Failure>> signUp(UserEntity user) async{
 
    try {
      final result = await firebaseRemoteDataSource.signUp(user);
      return left(result);
    } on InvalidEmailException catch(e) {
      return  right(InvalidFailure(errorMessage: e.errorMessage));
    } catch (e){
      return right(GeneralFailure());
    }
  }

  @override
  Future<Either<List<CourseEntity>, Failure>> getCourses() async{
     try {
      final result = await firebaseRemoteDataSource.fetchCourse();
      return left(result);
       
     } catch (e) {
      return right(ServerFailure());
       
     }
  }
  
  @override
  Future<Either<UserEntity, Failure>> getUser(String id) async{
   try {
     final result =  await firebaseRemoteDataSource.getUser(id);
     return left(result);
   } catch (e) {
     return right(ServerFailure());
   }
  }
  
  @override
  Future<Either<void, Failure>> logout() async{
    try {
      final result = await firebaseRemoteDataSource.logout();
      return left(result);
    } catch (e) {
      return right(ServerFailure());
    }
  }

  @override
  Future<Either<List<VideoEntity>, Failure>> getListOfVideo(String courseId) async{
    try {
      final result = await firebaseRemoteDataSource.getListOfVideo(courseId);
      return  left(result);
    } catch (e) {
      return right(ServerFailure());
    }
  }
  

}