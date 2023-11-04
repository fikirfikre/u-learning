import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/application/pages/signin_page/widget/cutomeTextField.dart';
import 'package:learning_app/application/pages/signin_page/widget/handleText.dart';
import 'package:learning_app/application/pages/welcom_page/widget/button.dart';

import 'bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                     context.read<SignUpBloc>().add(ClearForm());
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            ),
            body:  SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.all(20.0),
                child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      const    Center(
                              child: HandleText(
                                  text:
                                      "Enter your details below & free sign up")),
                    const      Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleText(text: "User Name"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleTextField(
                                hintText: "Enter your user name",
                                prefixIcon: Icons.person,
                                textEditingController: _usernameController,
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please enter your name';
                                  }
                                },),
                          ),
                        const  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleText(text: "Email"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleTextField(
                                hintText: "Enter your email",
                                prefixIcon: Icons.person,
                                textEditingController: _emailController,
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please enter your password';
                                  }
                                },),
                          ),
                         const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleText(text: "password"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleTextField(
                                hintText: "Enter your password",
                                prefixIcon: Icons.lock,
                                textEditingController: _passwordController,
                                isObscure: true,
                                validator: (value){
                                  if(value.isEmpty){
                                  return 'Please enter your password';
                                  }
                                  
                                },),
                          ),
                       const   Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleText(text: "Confirm password"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HandleTextField(
                                hintText: "Enter your confirm password",
                                prefixIcon: Icons.lock,
                                textEditingController:TextEditingController() ,
                                isObscure: true,
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please confirm your password';

                                  }else if(value != _passwordController.text){
                                    return 'Does not much with the password';
                                  }
                                },),
                          ),
                        const  HandleText(
                              text:
                                  "By creating account you have to agree with the terms and contradiction"),
                                     if(state is SignUpFailed) ...{
                                 Center(
                            child: Text(
                              state.errorMessage,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                          },
                         const SizedBox(
                            height: 50,
                          ),
                         
                    
                          if(state is SignUpLoading) ...{
                                  LoadingCustomButton()
                          }
                        else ...{
                          InkWell(
                            onTap: () {
                              if(_formKey.currentState!.validate()){
                               context.read<SignUpBloc>().add(SignupButtonPressed(userName: _usernameController.text, email: _emailController.text, password: _passwordController.text));
                              }
                            },
                            child: CustomeButton(buttonText: "Sign up"))}
                        ],
                      ),
                    );
                  },
                ),
              ),
            )),
      ),
    );
  }
}
