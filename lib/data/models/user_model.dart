import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/user_entity.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel(

      { super.userId,
      required super.userName,
      required super.email,
      required super.listOfCourse,
      required super.imageUrl,
       super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        listOfCourse: json['listOfCourse'],
        userName: json['name'],
        email: json['email'],
        imageUrl: json['image_url']??""
        );
  }
  Map<String, dynamic> toJson(UserModel user) {
    return {
      'userId': user.userId,
      'userName': user.userName,
      'email': user.email,
      'password': user.password,
      'image_url':user.imageUrl
    };
  }
}
