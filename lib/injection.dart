import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_app/application/pages/home_screen/bloc/home_bloc.dart';

import 'package:learning_app/application/pages/signin_page/bloc/sign_in_bloc.dart';
import 'package:learning_app/application/pages/user/bloc/user_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/bloc/welcom_bloc.dart';
import 'package:learning_app/data/datasource/local_datasource/sharedprefernce_datasourceImpl.dart';
import 'package:learning_app/data/datasource/remote_datasource/firebase_remote_datasourceImpl.dart';
import 'package:learning_app/data/repository/firebase_repository.dart';
import 'package:learning_app/data/repository/shared_preference_repository_impl.dart';
import 'package:learning_app/domain/repository/firebase_repository.dart';
import 'package:learning_app/domain/usecase/get_course_usecase.dart';
import 'package:learning_app/domain/usecase/sharedPreference_usecases.dart';
import 'package:learning_app/domain/usecase/user_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/pages/signup_page/bloc/sign_up_bloc.dart';
import 'data/datasource/local_datasource/sharepreference_datasource.dart';
import 'data/datasource/remote_datasource/firebase_remote_datasource.dart';
import 'domain/repository/shared_preference_repository.dart';

var sl = GetIt.instance;
Future<void> init() async{
  sl.registerFactory(() => SignInBloc(useCases: sl(),sharedUseCase: sl()));
  sl.registerFactory(() => UserUseCases(firebaseRepository: sl()));
  sl.registerFactory<FirebaseRepository>(() => FirebaseRepositoryImpl(firebaseRemoteDataSource: sl()));
  sl.registerFactory<FirebaseRemoteDataSource>(() => FirebaseRemoteDataSourceImpl(auth: sl()));
  sl.registerFactory(() => FirebaseAuth.instance);


  //signup
  sl.registerFactory(() => SignUpBloc(userUseCases: sl()));

  //pref

  sl.registerFactory(() => SharedPreferencesUseCase(sharedPreferencesRepository: sl()));
  sl.registerFactory<SharedPreferencesRepository>(() => SharedPreferencesRepositoryImpl(sharedDataSource: sl()));
  sl.registerFactory<SharedPrefereneceLocalDataSource>(() => SharedPrefereneceLocalDataSourceImpl(prefs: sl.get<SharedPreferences>()));
  sl.registerSingletonAsync(() => SharedPreferences.getInstance());
  await sl.allReady();

  //welcom
  sl.registerFactory(() => WelcomeBloc(sharedPreferencesUseCase: sl()));

  //courses
  sl.registerFactory(() => CoursesUseCases(firebaseRepository: sl()));
  sl.registerFactory(() => HomeBloc(coursesUseCases: sl()));

  //
  sl.registerFactory(() => UserBloc(userUseCases: sl()));
}