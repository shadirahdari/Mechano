import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/InputText.dart';
import 'package:flutter_application_1/components/LabelText.dart';
import 'package:flutter_application_1/components/Logo.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText.dart';
import 'package:flutter_application_1/components/withTap.dart';
import 'package:flutter_application_1/utils/pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenPanel(
      [
        Space(),
        Logo(),
        Space(),
        TitleText('Sign In to get back on the road, Today!', fontSize: 16),
        Space(2),
        InputText("Email"),
        Space(),
        InputText("Password"),
        Space(2),
        Button("Login", onTap: pages.Login(context)),
        Space(),
        Button("Sign Up", onTap: pages.SignUp(context)),
        Space(),
        withTap(
          LabelText(
            "Forget Password,Click here",
            fontSize: 16,
          ),
          pages.ForgetEmailPage(context),
        ),
      ],
    );
  }
}
