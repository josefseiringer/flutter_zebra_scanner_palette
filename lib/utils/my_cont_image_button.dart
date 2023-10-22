import 'package:flutter/material.dart';
import '../constants.dart';

class MyContainerImageButton extends StatelessWidget {
  final VoidCallback onTab;
  final String labelText;
  final String pathToImage;
  const MyContainerImageButton({
    super.key,
    required this.onTab,
    required this.labelText,
    required this.pathToImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: kContainerButtonColor,
          border: Border.all(
            color: kContainerBorderColor,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: MediaQuery.of(context).size.width,
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(pathToImage),
              color: kContainerlabelColor,
            ),
            Text(
              labelText.toUpperCase(),
              style: kTextStyleContainerInhalt,
            ),
          ],
        ),
      ),
    );
  }
}
