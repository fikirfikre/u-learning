import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/data/Exception/exception.dart';
import 'package:learning_app/data/datasource/remote_datasource/firebase_remote_datasource.dart';
import 'package:learning_app/data/models/course_model.dart';
import 'package:learning_app/data/models/user_model.dart';
import 'package:learning_app/domain/entity/course_entity.dart';
import 'package:learning_app/domain/entity/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource{
   final FirebaseAuth auth;
   final  FirebaseFirestore store = FirebaseFirestore.instance;
   FirebaseRemoteDataSourceImpl({required this.auth});
  @override
  Future<UserCredential> signIn(UserEntity user) async{
    try {
     final users = await auth.signInWithEmailAndPassword(email: user.email, password: user.password); 
      return users;
    } 
    catch (e) {
        if(e is FirebaseAuthException){
          throw InvalidEmailException(errorMessage: e.code);
        }else{
     
            throw ServerException();
        }
    }

  }
  
  @override
  Future<void> signUp(UserEntity user) async{
   
    try {
    
     UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
     User? us = userCredential.user;
     if(us != null){
      store.collection('users').doc(us.uid).set({
        'name':user.userName,
        'email':user.email,
      });
     }
      
    } catch (e) {

      if (e is FirebaseAuthException){
         
          throw InvalidEmailException(errorMessage: e.code);
        
      }
      throw ServerException();
    }
  }

  @override
  Future<List<CourseModel>> fetchCourse() async{

    try {
      QuerySnapshot querySnapshot = await store.collection('course').get();
      
      List<CourseModel> courses = querySnapshot.docs.map((doc){
        
        return CourseModel.fromFirestore(doc);
      }).toList();

      return courses;
      
    } catch (e) {
     
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(id) async{
    try {
      final user =  store.collection("users").doc(id);
      DocumentSnapshot querySnapshot = await user.get();

      Map<String,dynamic> json = querySnapshot.data() as Map<String,dynamic>;
      UserModel userModel = UserModel.fromJson(json);
      return userModel;
    } catch (e) {
       throw ServerException();
    }
  }
  
  @override
  Future<void> logout() {
    // TODO: implement logout
  
    try {
      return auth.signOut();
    } catch (e) {
      throw ServerException();
    }
  }
 

}