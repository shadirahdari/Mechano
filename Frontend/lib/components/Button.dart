import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/withTap.dart';

const buttonRedGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFAF2C27),
    Color(0xFFEF2C32),
    Color(0xFFCE2C27),
    Color(0xFFAF2C27),
  ],
  stops: [0.0, 0.25, 0.75, 1.0],
);

Widget Button(String text, {void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: SizedBox(
      width: 250,
      height: 55,
      child: withTap(
          Container(
            decoration: BoxDecoration(
              gradient: buttonRedGradient,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          onTap),
    ),
  );
}
