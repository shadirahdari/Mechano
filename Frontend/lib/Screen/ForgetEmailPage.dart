import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/InputText.dart';
import 'package:flutter_application_1/components/Logo.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText.dart';
import 'package:flutter_application_1/utils/pages.dart';

class ForgetEmailPage extends StatefulWidget {
  const ForgetEmailPage({super.key});

  @override
  State<ForgetEmailPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgetEmailPage> {
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
        TitleText('Your Email Address', fontSize: 16),
        Space(1),
        InputText("Reset Password"),
        Space(5),
        // ForgetPassword(
        //   onTap:   navigateToForgetPasswordPhonePage(context),
        // ),
        Button(
          "Reset Password",
          onTap: pages.Forgetpasswordphonepage(context),
        ),
      ],
    );
  }
}
