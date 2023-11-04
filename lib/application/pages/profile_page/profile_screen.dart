

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/home_screen/widget/more_menu.dart';
import 'package:learning_app/application/pages/profile_page/widget/list_of_option.dart';
import 'package:learning_app/application/pages/profile_page/widget/list_of_settings.dart';
import 'package:learning_app/application/pages/setting_page/setting_screen.dart';
import 'package:learning_app/application/pages/user/bloc/user_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
 
  @override
  Widget build(BuildContext context) {
     final userState = BlocProvider.of<UserBloc>(context,listen: false).state;
      return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:const Text("Profile"),
      
          actions: [
            IconButton(onPressed: (){}, icon: MoreMenuMethod())
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const  ProfilePicture(),
              if(userState is UserFetched)...{
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(userState.user.userName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ),
              },
              
           const   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(icon: Icons.camera_alt_rounded,label: "My Courses",),
                  CustomContainer(icon: Icons.book_sharp, label: "Buy Courses"),
                  CustomContainer(icon: Icons.star, label: "4.9")
                ],
              ),
            const  SizedBox(height: 15,),
              
            GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context){
                  
                  return SettingScreen();}));
              },
              child: const  CustomeRowWidget(label: "Settings",icon: Icons.settings,)),
          const    CustomeRowWidget(label: "Payment Details", icon: Icons.payment_rounded),
          const    CustomeRowWidget(label: "Achievement", icon: Icons.safety_check),
          const    CustomeRowWidget(label: "Love", icon: Icons.heart_broken_sharp),
          const    CustomeRowWidget(label: "Learning Remiders", icon: Icons.add_box)

            ],
          ),
        ),
      );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.center,
      children: [
       const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/first.jpg"),
        ),
        Positioned(
          bottom: 0,
          right:5,
          child: Container(
           padding: EdgeInsets.all(3),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
            ),
            child:const Icon(Icons.edit,color: Colors.white,),
        )
        )
      ],
    );
  }
}


