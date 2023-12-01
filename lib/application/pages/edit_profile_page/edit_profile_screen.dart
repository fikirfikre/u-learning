import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.arrow_back_ios,color: Colors.amber,),
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          
        ),
      ),
    );
  }
}
