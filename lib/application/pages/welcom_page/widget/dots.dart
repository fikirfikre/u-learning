
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/welcom_bloc.dart';

class DotsScroll extends StatelessWidget {
  const DotsScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Positioned(
            bottom: 70.h,
            child: DotsIndicator(
              position: state.pageIndex,
              dotsCount: 3,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.amber,
                activeSize:const  Size(13, 8),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                size: const Size.square(8),
              ),
              mainAxisAlignment: MainAxisAlignment.center,
            ));
      },
    );
  }
}
