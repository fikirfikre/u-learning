import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final String email;
  final String password;
  final String imageUrl;
  final List<dynamic> listOfCourse;

  UserEntity(

      { this.imageUrl="",
        this.userId="",
       this.userName ="",
       this.email="",
       this.password="",
       this.listOfCourse = const []});

  @override
  // TODO: implement props
  List<Object?> get props =>[userId,userName,email,password,listOfCourse];
}
