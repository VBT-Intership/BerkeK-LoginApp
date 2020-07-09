import 'package:flutter/material.dart';

class CreateText extends StatelessWidget {

  String title;
  Color color; 
  double fontSize; 
  FontWeight fontWeight;
  TextAlign textAlign;

  CreateText(this.title, this.color, this.fontSize, this.fontWeight, this.textAlign);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}