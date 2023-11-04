
import 'package:flutter/material.dart';

class CustomeRowWidget extends StatelessWidget {
  const CustomeRowWidget({
    super.key,
    required this.label,
    required this.icon
    
  });
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 10),
          child:Icon(icon,color: Colors.white,),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        SizedBox(width: 20,),
        Text(label,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
      ],
    );
  }
}