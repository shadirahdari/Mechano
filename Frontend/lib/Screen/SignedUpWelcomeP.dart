import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/Logo.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText.dart';
import 'package:flutter_application_1/utils/pages.dart';

class SignedUpWelcomeP extends StatefulWidget {
  const SignedUpWelcomeP({super.key});

  @override
  State<SignedUpWelcomeP> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<SignedUpWelcomeP> {
  @override
  Widget build(BuildContext context) {
    return ScreenPanel([Row(
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
      Space(),
      Logo(),
      Space(3),
      TitleText('Welcome to Mecano!', fontSize: 16),
       Space(5),
      Button('Start', onTap: pages.Home(context)),
    ]);
  }
}
