import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/withTap.dart';

Widget Button2(String text, {void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: SizedBox(
      width: 250,
      height: 55,
      child: withTap(
        Container(
          decoration: BoxDecoration(
            color: Colors.black, 
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white, // Set the text color to white
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        onTap,
      ),
    ),
  );
}
