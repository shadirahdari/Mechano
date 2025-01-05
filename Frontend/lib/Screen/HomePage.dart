import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Button.dart';
import 'package:flutter_application_1/components/FooterBar.dart';
import 'package:flutter_application_1/components/NavBar.dart';
import 'package:flutter_application_1/components/ScreenPanel.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText.dart';
import 'package:flutter_application_1/utils/pages.dart';
import 'package:flutter_application_1/Modals/showReasonModal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        pages.Home(context); // Navigate to Home
        break;
      case 1:
        pages.Home(context); // Navigate to Search
        break;
      case 2:
        pages.Home(context); // Navigate to Profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenPanel([
      Space(4),
      TitleText('No mechanic request currently', fontSize: 18),
      Space(6),
      TitleText('Have a car problem?', fontSize: 16),
      Space(4),
      Button("Request a Mechanic!", onTap: () {
        showReasonModal(context);
      }),
      Space(6),
    ], appBar: NavBar(), bottomNavigationBar: FooterBar());
  }
}
