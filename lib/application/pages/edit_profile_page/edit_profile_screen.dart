import 'package:flutter/material.dart';
import 'package:learning_app/application/pages/profile_page/profile_screen.dart';
import 'package:learning_app/application/pages/signin_page/widget/cutomeTextField.dart';
import 'package:learning_app/application/pages/signin_page/widget/handleText.dart';
import 'package:learning_app/application/pages/welcom_page/widget/button.dart';
import 'package:learning_app/domain/entity/user_entity.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Fikir");
  final TextEditingController _emailController = TextEditingController(text: "fikir@gmail.com");
  // final TextEditingController _passwordController =


  @override
  Widget build(BuildContext context) {
    final user = UserEntity(userName: "Fikir");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:const Icon(Icons.arrow_back_ios,color: Colors.amber,),
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Stack(
     alignment: Alignment.center,
      children: [
        if(user.imageUrl == "")...{
           CircleAvatar(
          radius: 50,
          backgroundColor: const Color.fromARGB(255, 58, 50, 50),
          child: Text(user.userName[0].toUpperCase(),style:const TextStyle(
            color: Colors.amber,
            fontSize: 35,
            fontWeight: FontWeight.w900
          ),),
        ),

        },
       if(user.imageUrl !="")...{
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(user.imageUrl),
        ),
       },
        Positioned(
          bottom: 0,
          right:120,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const EditProfileScreen()));
            },
            child: Container(
             padding: EdgeInsets.all(3),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber,
              ),
              child:const Icon(Icons.edit,color: Colors.white,),
                  ),
          )
        )
      ],
    ),
        
           const  Padding(
               padding:  EdgeInsets.fromLTRB(0, 30, 0, 10),
               child:    HandleText(text: "Full Name"),
             ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _nameController,
                    decoration:const InputDecoration(
                        focusedBorder:  OutlineInputBorder(
                borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                color: Colors.amber,
                width: 1.0,
                
              )),
              
              border:  OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(15)))
              
                     
                    ),
              ),
            ),
           const Padding(
              padding:  EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: HandleText(text: "Email"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                            focusedBorder:  OutlineInputBorder(
                borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                color: Colors.amber,
                width: 1.0,
                
              )),
              
              border:  OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(15)))
                ),
                
                  
              ),
            ),
           const SizedBox(height: 50,),
          const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AButton(text:"BackToHome"),
               AButton(text: "Save Changes")
              ],
            )
        
        
           ],
          ),
        ),
      ) ,
    );
  }
}

class AButton extends StatelessWidget {
  const AButton({
    super.key,
    required this.text
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      
      style: ButtonStyle(

        padding:const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10,horizontal: 20)),
        overlayColor:MaterialStatePropertyAll(Colors.amber.shade100),
        foregroundColor:const MaterialStatePropertyAll(Colors.amber),
textStyle:const MaterialStatePropertyAll(TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
      ),
      onPressed: (){}, child: Text(text));
  }
}
