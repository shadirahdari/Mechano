import 'package:flutter/material.dart';

Widget TitleText(String text, {double fontSize = 28}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
