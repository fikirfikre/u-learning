import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.icon,
    required this.label
  });
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
        // margin: EdgeInsets.symmetric(horizontal: 2),
       width: MediaQuery.of(context).size.width/3.6,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Icon(icon,color: Colors.white,size: 20,weight: 10,),
          ),
          
          Text(label,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}