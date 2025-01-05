import 'package:flutter/material.dart';

Widget TitleText2(String text, {double fontSize = 28}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.center,
    ),
  );
}
