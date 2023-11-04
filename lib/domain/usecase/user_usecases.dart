import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/domain/entity/user_entity.dart';
import 'package:learning_app/domain/failure/failure.dart';
import 'package:learning_app/domain/repository/firebase_repository.dart';

class UserUseCases{

final FirebaseRepository firebaseRepository;

  UserUseCases({required this.firebaseRepository});

Future <Either<UserCredential,Failure>> SignIn(UserEntity user) async{
  
  return firebaseRepository.signIn(user);
}

Future <Either<void,Failure>> SignUp(UserEntity user) async{
  
  return firebaseRepository.signUp(user);
}

Future<Either<UserEntity,Failure>> getUser(String id) async{
  return firebaseRepository.getUser(id);
}
Future<Either<void,Failure>> logout(){
  return firebaseRepository.logout();
}


}