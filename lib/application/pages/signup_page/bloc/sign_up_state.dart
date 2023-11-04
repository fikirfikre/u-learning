part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();
  
  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccess extends SignUpState {}
final class SignUpFailed extends SignUpState {
  final String errorMessage;
  SignUpFailed({required this.errorMessage}) ;
}