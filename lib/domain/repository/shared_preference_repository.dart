import 'package:flutter/foundation.dart';

abstract class SharedPreferencesRepository{
   Future<void> setIsLogged(bool value);
   bool getIsLogged();
}