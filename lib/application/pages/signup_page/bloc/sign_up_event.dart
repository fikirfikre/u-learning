part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignUpEvent {
  final String userName;
  final String email;
  final String password;
  SignupButtonPressed({required this.userName,required this.email, required this.password});

}
class ClearForm extends SignUpEvent{}