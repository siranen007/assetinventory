import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  Text captionText;
  Color buttonColor;

  CustomMaterialButton(this.captionText, this.buttonColor);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 6.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: captionText,
      ),
      color: buttonColor,
      hoverColor: Colors.blue[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
