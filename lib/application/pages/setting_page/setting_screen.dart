import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/signin_page/bloc/sign_in_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/bloc/welcom_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/welcome_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if(state is SignInSuccess){
            
          return Center(
            child: GestureDetector(
                onTap: () {
                  BlocProvider.of<SignInBloc>(context)
                      .add(LogOutButtonPressed());
                  BlocProvider.of<WelcomeBloc>(context)
                      .add(LogoutEvent());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Welcome()),
                      (route) => false);
                      
                },
                child: Text("Logout")),
          );
          }else if(state is SignInLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
            
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
