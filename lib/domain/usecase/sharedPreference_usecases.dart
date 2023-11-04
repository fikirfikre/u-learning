import 'package:learning_app/domain/repository/shared_preference_repository.dart';

class SharedPreferencesUseCase {
  final SharedPreferencesRepository sharedPreferencesRepository;
  SharedPreferencesUseCase({required this.sharedPreferencesRepository});
  
  Future<void> setBool(bool value){
   return sharedPreferencesRepository.setIsLogged(value);
  }
  bool getIsLogged(){
    return  sharedPreferencesRepository.getIsLogged();
  }
 
}