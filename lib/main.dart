import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learning_app/application/pages/detail_page/bloc/detail_bloc.dart';
import 'package:learning_app/application/pages/home_screen/bloc/button_pressed_bloc.dart';
import 'package:learning_app/application/pages/home_screen/bloc/home_bloc.dart';

import 'package:learning_app/application/pages/signin_page/bloc/sign_in_bloc.dart';
import 'package:learning_app/application/pages/signin_page/sign_in_screen.dart';
import 'package:learning_app/application/pages/signup_page/bloc/sign_up_bloc.dart';
import 'package:learning_app/application/pages/signup_page/sign_up_screen.dart';
import 'package:learning_app/application/pages/user/bloc/user_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/bloc/welcom_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/welcome_screen.dart';
import 'package:learning_app/data/datasource/local_datasource/sharepreference_datasource.dart';
import 'package:learning_app/domain/usecase/sharedPreference_usecases.dart';
import 'package:learning_app/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'injection.dart' as d;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await d.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context) {
  bool result =  sl.get<SharedPreferencesUseCase>().getIsLogged();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl.get<WelcomeBloc>(),
          ),
         
          // BlocProvider(create: (_)=>SignInBloc()),
           BlocProvider(create: (_)=>sl.get<SignUpBloc>()),
           BlocProvider(create: (_) => sl.get<SignInBloc>()),
           BlocProvider(create: (_)=>sl.get<HomeBloc>()),
           BlocProvider(create: (_)=>sl.get<UserBloc>()),
           BlocProvider(create: (_)=>sl.get<DetailBloc>()),
           BlocProvider(create: (_)=>ButtonPressedBloc())

        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      elevation: 0, backgroundColor: Colors.white,titleTextStyle: TextStyle(color: Colors.black,fontSize: 20))),
              debugShowCheckedModeBanner: false,
              home: !result ? Welcome() : SignInPage()
            );
          },
        ));
  }
}


