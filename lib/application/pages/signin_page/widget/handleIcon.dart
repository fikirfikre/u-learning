import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandleIcons extends StatelessWidget {
  HandleIcons({super.key, required this.onTap, required this.imageurl});
  final VoidCallback onTap;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 30.w,
        height: 30.w,
        child: Image.asset("assets/images/$imageurl.png"),
      ),
    );
  }
}
