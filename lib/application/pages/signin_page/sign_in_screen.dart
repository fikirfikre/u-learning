import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/app_state.dart';
import 'package:learning_app/application/pages/home_screen/bloc/home_bloc.dart';
import 'package:learning_app/application/pages/signin_page/widget/cutomeTextField.dart';
import 'package:learning_app/application/pages/signin_page/widget/handleIcon.dart';
import 'package:learning_app/application/pages/signin_page/widget/handleText.dart';
import 'package:learning_app/application/pages/signup_page/sign_up_screen.dart';
import 'package:learning_app/application/pages/user/bloc/user_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/widget/button.dart';
import 'package:learning_app/domain/usecase/sharedPreference_usecases.dart';
import 'package:learning_app/main.dart';

import '../home_page/home_screen.dart';
import 'bloc/sign_in_bloc.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isHover = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Log In",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: Colors.grey.withOpacity(0.3),
                    height: 1,
                  )),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 40, 5, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HandleIcons(onTap: () {}, imageurl: "google"),
                            HandleIcons(onTap: () {}, imageurl: "apple-logo"),
                            HandleIcons(onTap: () {}, imageurl: "instagram")
                          ],
                        ),
                      ),
                      const HandleText(
                        text: "Or use your email account login",
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const HandleText(text: "Email"),
                           Padding(
                            padding:const EdgeInsets.all(8.0),
                            child: HandleTextField(
                              hintText: "Enter your email",
                              prefixIcon: Icons.person,
                              textEditingController: _emailController,
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Please enter your email';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const HandleText(text: "Password"),
                
                           Padding(
                            padding:const EdgeInsets.all(8.0),
                            child: HandleTextField(
                              hintText: "Enter your password",
                              prefixIcon: Icons.lock,
                              textEditingController: _passwordController,
                              isObscure: true,
                              validator: (value){
                                print(value);
                                if(value.isEmpty){
                                  // print("empty");
                                  return 'Please enter your password';
                                }
                              },
                            ),
                          ),
                         const SizedBox(height: 10),
                          HandleStatefullText(),
                          if(state is SignInFailed)...{
                           Center(
                            child: Text(
                              state.errorMessage,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),},
                          SizedBox(
                            height: 50.h,
                          ),
                          if(state is SignInLoading) ...{
                             const LoadingCustomButton()}
                            else ...{
                              InkWell(
                              onTap: (){
                                if(_formKey.currentState!.validate()){
                                context.read<SignInBloc>().add(SignInButtonPressed(email:_emailController.text,password: _passwordController.text));

                                context.read<SignInBloc>().stream.listen((state) {
                                  if(state is SignInSuccess){
                                    context.read<UserBloc>().add(GetUserIdEvent(userId: state.user.user!.uid));
                                   context.read<HomeBloc>().add(HomeEvents());
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                }
                                 });
                                
                                }
                              },
                                child:const CustomeButton(buttonText: "Log In") ,
                              )
                           ,},
                          // ,
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage() ));
                            },
                            child: const CustomeSecondaryButton(buttonText: "Sign Up"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}

class HandleStatefullText extends StatefulWidget {
  HandleStatefullText({
    super.key,
  });

  @override
  State<HandleStatefullText> createState() => _HandleStatefullTextState();
}

class _HandleStatefullTextState extends State<HandleStatefullText> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        onTap: () {},
        onHover: (isHover) {
          setState(() {
            _isHover = isHover;
            print(_isHover);
          });
        },
        child: Text(
          "Forgot password",
          style: TextStyle(
            color: !_isHover ? Colors.amber : Colors.black,
            // decoration: TextDecoration.underline
          ),
        ));
  }
}
