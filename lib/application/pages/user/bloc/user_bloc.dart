import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/user_entity.dart';
import 'package:learning_app/domain/usecase/user_usecases.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserUseCases userUseCases;
  UserBloc({required this.userUseCases}) : super(UserInitial()) {
    on<GetUserIdEvent>((event, emit) async{
     final result = await userUseCases.getUser(event.userId);
      result.fold((user) {
        print(user);
         emit (UserFetched(user:user));}, (r) => null);
    });
  }
}
