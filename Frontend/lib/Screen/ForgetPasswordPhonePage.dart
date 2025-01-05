import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/InputText.dart';
import 'package:flutter_application_1/components/Logo.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText.dart';
import 'package:flutter_application_1/utils/pages.dart';

class Forgetpasswordphonepage extends StatefulWidget {
  const Forgetpasswordphonepage({super.key});

  @override
  State<Forgetpasswordphonepage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Forgetpasswordphonepage> {
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
                'Resset password',
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
        Logo(),
        Space(2),
        TitleText('Your Phone number', fontSize: 16),
        Space(),
        InputText("Phone"),
        Space(5),
        Button(
          "Reset Password",
          onTap: pages.SignedupWelcome(context),
        ),
        // ForgetPassword(
        //   onTap:   navigateToForgetPasswordPhonePage(context),
        // ),
      ],
    );
  }
}
