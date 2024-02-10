import 'package:flutter/material.dart';

Widget styledText(
  String text, {
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w600,
  Color color = Colors.white,
  TextAlign textAlign = TextAlign.left,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
