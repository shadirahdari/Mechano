import 'package:flutter/material.dart';

Widget TextLink() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Forgot password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(width: 8), // Add spacing between texts
      GestureDetector(
        onTap: () {
          // Add navigation or logic for password recovery
          print('Navigate to Forgot Password page');
        },
        child: const Text(
          'Click here',
          style: TextStyle(
            color: Color.fromARGB(255, 254, 255, 255),
            fontWeight: FontWeight.bold,
            decoration:
                TextDecoration.underline, // Add underline for link style
          ),
        ),
      ),
    ],
  );
}
