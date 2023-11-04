import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final String email;
  final String password;

  UserEntity(
      { this.userId="",
       this.userName ="",
       this.email="",
       this.password=""});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
