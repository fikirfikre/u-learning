import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.buttonText,
  });

  final String buttonText;
  

  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.center,
     width: 325.w,
     height: 50.h,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(15),
       color: Colors.amber,
           
     ),

     child: Text(
       buttonText,
       style: TextStyle(
       fontSize: 20.sp,
       color: Colors.white,
       fontWeight: FontWeight.bold,
           
     ),
     textAlign: TextAlign.center,
     ),
           
    );
  }
}

class CustomeSecondaryButton extends StatelessWidget {
  const CustomeSecondaryButton({
    super.key,
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.center,
     width: 325.w,
     height: 50.h,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(15),
       color: Colors.white,
       border: Border.all(width: 1,
       color: Colors.grey.withOpacity(0.5)),
       
           
     ),
     child: Text(
       buttonText,
       style: TextStyle(
       fontSize: 20.sp,
       color: Colors.amber,
       fontWeight: FontWeight.bold,
           
     ),
     textAlign: TextAlign.center,
     ),
           
    );
  }
}
class LoadingCustomButton extends StatelessWidget {
  const LoadingCustomButton({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.center,
     width: 325.w,
     height: 50.h,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(15),
       color: Colors.amber,
           
     ),
     child:const  SizedBox(
      height: 20,
      width: 20,
       child: CircularProgressIndicator(
        backgroundColor: Colors.white,color: Colors.amber,
        strokeWidth: 3,),
     ),
           
    );
  }
}