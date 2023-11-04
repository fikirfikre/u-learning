import 'package:flutter/material.dart';

class MoreMenuMethod extends StatelessWidget {
  const MoreMenuMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.amber,
        ),
        itemBuilder: (_) {
          return const <PopupMenuEntry>[
            PopupMenuItem(child: Text("first")),
            PopupMenuItem(child: Text("second")),
            PopupMenuItem(child: Text("third"))
          ];
        });
  }
}