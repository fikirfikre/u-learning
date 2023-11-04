import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/application/pages/signin_page/sign_in_screen.dart';
import 'package:learning_app/application/pages/welcom_page/widget/button.dart';
import 'package:learning_app/domain/usecase/sharedPreference_usecases.dart';
import 'package:learning_app/injection.dart';
import 'package:learning_app/main.dart';

class OnBoardingPage extends StatelessWidget {
   OnBoardingPage({
    super.key,
    required this.index,
    required this.imageurl,
    required this.title,
    required this.caption,
    required this.buttonText,
    required this.controller,
    
  });
  int index;
  String imageurl;
  String title;
  String caption;
  String buttonText;
  PageController controller;
  SharedPreferencesUseCase usecase = sl.get<SharedPreferencesUseCase>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
      child: Column(
        children: [
          Container(            
            width: 345.w,
            height: 345.w,             
            child: Image.asset(imageurl)),
            Text(title,style: TextStyle(
              fontSize: 24.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.center,),
            Text(caption,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.normal,
    
            ),
            
            textAlign: TextAlign.center,),
           Padding(
             padding: const EdgeInsets.only(top: 100),
             child: InkWell(
              onTap: (){
                if(index<3){
                  controller.animateToPage(index, duration: Duration(microseconds: 500), curve: Curves.decelerate);
                }else {
                  usecase.setBool(true);
                
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>SignInPage())
                  );
                }
              },
              child: CustomeButton(buttonText: buttonText)),
           )
            
        ],
      ),
    );
  }
}

