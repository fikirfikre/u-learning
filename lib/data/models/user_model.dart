import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/user_entity.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel(
      { super.userId,
      required super.userName,
      required super.email,
       super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

        userName: json['name'],
        email: json['email'],
        );
  }
  Map<String, dynamic> toJson(UserModel user) {
    return {
      'userId': user.userId,
      'userName': user.userName,
      'email': user.email,
      'password': user.password
    };
  }
}
