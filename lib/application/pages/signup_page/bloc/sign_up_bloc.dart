import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/user_entity.dart';
import 'package:learning_app/domain/failure/failure.dart';
import 'package:learning_app/domain/usecase/user_usecases.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserUseCases userUseCases;
  SignUpBloc({required this.userUseCases}) : super(SignUpInitial()) {
    on<SignupButtonPressed>((event, emit) async{
      // TODO: implement event handler
      emit(SignUpLoading());
      
     final signUporFailure = await userUseCases.SignUp(UserEntity(userName: event.userName, email: event.email, password: event.password));
      print(signUporFailure);
     signUporFailure.fold((signUp) => emit(SignUpSuccess()), (failure) {
       print(failure.runtimeType == InvalidFailure);
      if(failure.runtimeType == InvalidFailure){
        print("is it");
        final InvalidFailure invalidFailure = failure as InvalidFailure;
          emit (SignUpFailed(errorMessage: invalidFailure.errorMessage));
      }else{
        emit(SignUpFailed(errorMessage: "try again"));
      }
     });
      
    });

    on<ClearForm> ((event,emit){
      emit(SignUpInitial());
    });
  }
}
