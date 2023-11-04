abstract class SharedPrefereneceLocalDataSource{
  Future<void> setIsLoggedIn(bool value);
  bool getLoggedIn();
}