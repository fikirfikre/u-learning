import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/user/bloc/user_bloc.dart';

import 'more_menu.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: MoreMenuMethod(),
      backgroundColor: Colors.white,
      elevation: 0,
      actions:  [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: BlocBuilder<UserBloc, UserState>(
    
            builder: (context, state) {
              if(state is UserFetched && state.user.imageUrl != ""){
              return CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
               
                backgroundImage: NetworkImage(state.user.imageUrl,scale: 20)
              );
              }else if(state is UserFetched) {
                return  CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(state.user.userName[0].toUpperCase(),style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,

                  fontWeight: FontWeight.w900
                ),),
              );
              }else{
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}
