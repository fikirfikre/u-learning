part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInButtonPressed extends SignInEvent{
  final String email;
  final String password;

  const SignInButtonPressed({required this.email,required this.password});
  
}
class LogOutButtonPressed extends SignInEvent {}