// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import 'sharepreference_datasource.dart';

class SharedPrefereneceLocalDataSourceImpl
    implements SharedPrefereneceLocalDataSource {
  SharedPreferences prefs;
  String loggedKey = 'isLoggedIn';
  SharedPrefereneceLocalDataSourceImpl({
    required this.prefs,
  });
  @override
  Future<void> setIsLoggedIn(bool value) async {
    await prefs.setBool(loggedKey, value);
  }

  @override
  bool getLoggedIn()  {
    return prefs.getBool(loggedKey) ?? false;
  }
  Future<bool> logout() async{
    return  await prefs.remove(loggedKey);
  }
}
