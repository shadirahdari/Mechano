import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modals/showReasonModal.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/LabelText.dart';
import 'package:flutter_application_1/components/Logo.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText.dart';
import 'package:flutter_application_1/utils/pages.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenPanel([
      Space(),
      Logo(),
      Space(2),
      TitleText('Welcome to Mecano!', fontSize: 28),
      Space(2),
      LabelText(
          'Your solution on the road is just a tap away! We\'re here to connect you with skilled professionals, fast and hassle-free.'),
      Space(4),
      Button('Let\'s go', onTap: pages.Login(context)),
    ]);
  }
}
