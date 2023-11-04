import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/app_bloc.dart';
import 'package:learning_app/app_event.dart';
import 'package:learning_app/app_state.dart';
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
           BlocProvider(create: (_) => AppBloc()),
          // BlocProvider(create: (_)=>SignInBloc()),
           BlocProvider(create: (_)=>sl.get<SignUpBloc>()),
           BlocProvider(create: (_) => sl.get<SignInBloc>()),
           BlocProvider(create: (_)=>sl.get<HomeBloc>()),
           BlocProvider(create: (_)=>sl.get<UserBloc>()),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<AppBloc, AppStates>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "herotag1",
              onPressed: () =>
                  BlocProvider.of<AppBloc>(context).add(Incrementing()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "herotag2",
              onPressed: () =>
                  BlocProvider.of<AppBloc>(context).add(Decrementing()),
              tooltip: 'decrement',
              child: const Icon(Icons.minimize),
            ),
          ],
        ));
  }
}
