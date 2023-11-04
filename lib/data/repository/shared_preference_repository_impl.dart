import 'package:learning_app/data/datasource/local_datasource/sharepreference_datasource.dart';
import 'package:learning_app/domain/repository/shared_preference_repository.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository{
  final SharedPrefereneceLocalDataSource sharedDataSource;

  SharedPreferencesRepositoryImpl({required this.sharedDataSource});

  @override
  Future<void> setIsLogged(bool value) async {
    // TODO: implement setIsLogged
     sharedDataSource.setIsLoggedIn(value);
  }
  
  @override
  bool getIsLogged() {
    // TODO: implement getIsLogged
  return   sharedDataSource.getLoggedIn();
  }

  

}