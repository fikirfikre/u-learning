
import 'package:flutter/material.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({
    super.key,
    required FocusNode focusNode,
    required Color? iconColor,
  })  : _focusNode = focusNode,
        _iconColor = iconColor;

  final FocusNode _focusNode;
  final Color? _iconColor ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 70,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              cursorColor: Colors.amber,
              focusNode: _focusNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: _iconColor,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber)),
              ),
            ),
          ),
        ),
        Icon(
          Icons.opacity_outlined,
          color: Colors.amber,
        )
      ],
    );
  }
}
