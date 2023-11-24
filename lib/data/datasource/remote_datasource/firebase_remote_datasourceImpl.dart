

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:learning_app/data/Exception/exception.dart';
import 'package:learning_app/data/datasource/remote_datasource/django_remote_datasourceImpl.dart';
import 'package:learning_app/data/datasource/remote_datasource/firebase_remote_datasource.dart';
import 'package:learning_app/data/models/course_model.dart';
import 'package:learning_app/data/models/user_model.dart';
import 'package:learning_app/data/models/video_model.dart';

import '../../../domain/entity/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource{
   final FirebaseAuth auth;
   final  FirebaseFirestore store = FirebaseFirestore.instance;
    UserCredential? currnetUser;
   FirebaseRemoteDataSourceImpl({required this.auth});
  @override
  Future<UserCredential> signIn(UserEntity user) async{
    try {
     final users = await auth.signInWithEmailAndPassword(email: user.email, password: user.password); 
     currnetUser = users;
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
        'listOfCourse':user.listOfCourse
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
      final id = courses[0];
     await getListOfVideo(id.courseId);
    // DjangoRemoteDatasourceImpl django = DjangoRemoteDatasourceImpl();
    // String ans =  await django.createPaymentIntent();
    // print(ans);

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

  @override
  Future<List<VideoModel>> getListOfVideo(String courseId) async{
    try {
    DocumentSnapshot courseSnapshot = await store.collection("course").doc(courseId).get();
    CollectionReference videosCollection = courseSnapshot.reference.collection('video');
    QuerySnapshot videoQuerySnapshot = await videosCollection.get();
    List<VideoModel> videos = videoQuerySnapshot.docs.map((doc) => VideoModel.fromFirestore(doc)).toList();
    return videos;
    } catch (e) {
      throw ServerException();
    }


  }
  
  @override
  Future<void> addCourseToUserList(String courseId) async{
    final currentUser = FirebaseAuth.instance.currentUser;
    DocumentReference<Map<String,dynamic>> userDocument = store.collection("users").doc(currentUser!.uid);
     await userDocument.get().then((value) {
      if(value.exists){
    List exisitingList = value.data()?["listOfCourse"]??[];
            exisitingList.add(courseId);
            userDocument.update({
              'listOfCourse':exisitingList
            }).catchError((error) => throw ServerException());
      }else{
        throw ServerException();
      }
    }); 
    
    

     

    throw UnimplementedError();
  }
  
  @override
  Future<bool> isTheUserPaid(String courseId) async{
  bool? existed;
   try {
         final user = FirebaseAuth.instance.currentUser;
    DocumentReference<Map<String,dynamic>> userDocument = store.collection("users").doc(user!.uid);
   await userDocument.get().then((value){
      if(value.exists){
           List listOfCourse = value.data()?["listOfCourse"]??[];
           
           existed= listOfCourse.contains(courseId);
      }else{
        throw ServerException();
      }
    });
    return existed!;
   } catch (e) {
     throw ServerException();
   }

    
   
  }
 

}
