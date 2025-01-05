import 'package:flutter/material.dart';

Widget InputText(String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: SizedBox(
      width: 350,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint, // Use the hint passed as an argument
            ),
          ),
        ),
      ),
    ),
  );
}
