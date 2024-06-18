import 'package:flutter/material.dart';
import '../constants.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback onTab;
  final String labelText;
  final double buttonWidth;
  final double buttonHeight;
  final Color buttonColor;
  final Color buttonLabelColor;
  const MyTextButton({
    super.key,
    required this.onTab,
    required this.labelText,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonColor,
    required this.buttonLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: kContainerBorderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: TextButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor:
                WidgetStateProperty.all<Color>(kContainerButtonColor),
            foregroundColor:
                WidgetStateProperty.all<Color>(kContainerlabelColor),
          ),
          onPressed: onTab,
          child: Text(
            labelText.toUpperCase(),
            style: kMyTextStyle,
          ),
        ),
      ),
    );
  }
}
