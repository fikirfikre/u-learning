

import 'package:flutter/material.dart';

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
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.amberAccent,
          ),
        )
      ],
    );
  }
}