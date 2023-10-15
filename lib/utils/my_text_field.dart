import 'package:flutter/material.dart';
import '../constants.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Widget suffixIcon;
  final TextEditingController myController;
  final TextInputType myTextInputType;
  final bool bObscureText;
  final double mnTextfieldHeight;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.suffixIcon,
    required this.myController,
    required this.myTextInputType,
    required this.bObscureText,
    required this.mnTextfieldHeight,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mnTextfieldHeight,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: myController,
        keyboardType: myTextInputType,
        obscureText: bObscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          isCollapsed: true,
          hintText: hintText.toUpperCase(),
          hintStyle: kMyTextStyle,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
