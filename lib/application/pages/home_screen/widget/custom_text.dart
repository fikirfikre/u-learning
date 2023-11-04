import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, required this.onpressed, required this.txt});
  final VoidCallback onpressed;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Text(
          txt,
          style: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}