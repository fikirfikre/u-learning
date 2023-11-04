import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/data/repository/firebase_repository.dart';
import 'package:learning_app/domain/entity/user_entity.dart';
import 'package:learning_app/domain/failure/failure.dart';
import 'package:learning_app/domain/repository/firebase_repository.dart';
import 'package:learning_app/domain/usecase/sharedPreference_usecases.dart';
import 'package:learning_app/domain/usecase/user_usecases.dart';

import '../../../../injection.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserUseCases useCases;
  final SharedPreferencesUseCase sharedUseCase;
  // final FirebaseRepository repo = sl.get<FirebaseRepository>();
  UserCredential? userCredential;
  SignInBloc({required this.useCases, required this.sharedUseCase})
      : super(SignInInitial()) {
    on<SignInButtonPressed>((event, emit) async {
      emit(SignInLoading());


      var failureOrSignin = await useCases.SignIn(
          UserEntity(email: event.email, password: event.password));
      failureOrSignin.fold((signIn) {
        userCredential = signIn;
        emit(SignInSuccess(user: signIn));

        
      }, (failure) {
        if (failure.runtimeType == InvalidFailure) {
          final InvalidFailure invalidFailure = failure as InvalidFailure;
          emit(SignInFailed(errorMessage: invalidFailure.errorMessage));
        } else {
          SignInFailed(errorMessage: "try again");
        }
      });
    });

    on<LogOutButtonPressed>((event, emit) async{
      emit(SignInLoading());
      await sharedUseCase.setBool(false);
    final failureorlogout = await useCases.logout();
    failureorlogout.fold((l) =>emit(SignInInitial()) , (r) => emit(SignInFailed(errorMessage: "try again")));
      
      
      
      
    });
  }
}
