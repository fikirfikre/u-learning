import 'package:bloc/bloc.dart';
import 'package:learning_app/domain/usecase/sharedPreference_usecases.dart';
import 'package:meta/meta.dart';

part 'welcom_event.dart';
part 'welcom_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final SharedPreferencesUseCase sharedPreferencesUseCase;
  WelcomeBloc({required this.sharedPreferencesUseCase}) : super(WelcomeState()) {
    on<Welcomevent>((event, emit) async{
      
      emit(WelcomeState(pageIndex: state.pageIndex));
    
    });
    on<LogoutEvent>((event,emit){
      emit(WelcomeState(pageIndex: 0));
    });
    
  }
}
