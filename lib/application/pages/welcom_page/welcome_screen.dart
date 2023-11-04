import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/application/pages/welcom_page/bloc/welcom_bloc.dart';
import 'package:learning_app/application/pages/welcom_page/widget/page.dart';

import 'widget/dots.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController =PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: pageController,
                  onPageChanged: (value) {
                    state.pageIndex = value;
                    BlocProvider.of<WelcomeBloc>(context).add(Welcomevent());
                  },
                  children: [
                    OnBoardingPage(
                      index: 1,
                      imageurl: "assets/images/learn_one.jpg",
                      title: "First See Learning",
                      caption:
                          "Forget about a for a paper all knowledge in one learning",
                      buttonText: "Next",
                      controller: pageController,
                    ),
                    OnBoardingPage(
                        index: 2,
                        imageurl: "assets/images/learn_two.jpg",
                        title: "Connect With Everyone",
                        caption:
                            "Always keep in touch with your tutor and friend ",
                        buttonText: "Next",
                        controller: pageController,),
                    OnBoardingPage(
                        index: 3,
                        imageurl: "assets/images/learn_three.jpg",
                        title: "Always Fascinated Learnig",
                        caption:
                            "Anywhere, anytime. The time is at your discretion so study whenever you want ",
                        buttonText: "Get Started",
                        controller: pageController,),
                  ]),
              const DotsScroll()
            ],
          ),
        );
      },
    );
  }
}
