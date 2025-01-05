import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/InputText.dart';
import 'package:flutter_application_1/components/LabelText.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/utils/pages.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ScreenPanel(
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Space(2),
        LabelText(
          'Your journey to hassle-free car repairs starts here',
          fontSize: 16,
        ),
        Space(1),
        InputText("First Name"),
        Space(),
        InputText("Last Name"),
        Space(),
        InputText("Email"),
        Space(),
        InputText("Password"),
        Space(),
        InputText("Confirm Password"),
        Space(),
        InputText("Phone"),
        Space(),
        InputText("01/01/1990"),
        Space(),
        InputText("Gender"),
        Space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              activeColor: Colors.white,
              checkColor: const Color.fromARGB(255, 90, 89, 89),
            ),
            LabelText(
              "Accept Terms & Conditions",
              fontSize: 12,
            ),
          ],
        ),
        Space(),
        Button("Continue", onTap: pages.SignedupWelcome(context)),
        Space(),
      ],
    );
  }
}
