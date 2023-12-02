import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandleTextField extends StatefulWidget {
   HandleTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.textEditingController,
    required this.validator,
    this.isObscure = false

  });
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController textEditingController;
  final  validator;
   bool? isObscure;

  @override
  State<HandleTextField> createState() => _HandleTextFieldState();
}

class _HandleTextFieldState extends State<HandleTextField> {
  final FocusNode _focusNode = FocusNode();
  Color? _iconColor;
   @override
     void initState(){
      super.initState();
      _focusNode.addListener(() {
        setState(() {
          _iconColor =_focusNode.hasFocus? Colors.amber:Colors.black;
        });
      });
   }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,  
      controller: widget.textEditingController,
      cursorColor: Colors.amber,
      focusNode: _focusNode,
      obscureText: widget.isObscure!,
      decoration: InputDecoration(
          prefixIconColor: _iconColor,
          prefixIcon: Icon(widget.prefixIcon),
          hintText: widget.hintText,
          
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
              fontSize: 12.sp,
              fontWeight: FontWeight.normal),
              
          focusedBorder: const OutlineInputBorder(
            borderRadius:
                  BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
            color: Colors.amber,
            width: 1.0,
            
          )),
          
          border: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(15)))
                  ),
    );
  }
}
