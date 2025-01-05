import 'package:flutter/material.dart';

Widget ScreenPanel(List<Widget> children, {Widget? bottomNavigationBar, PreferredSizeWidget? appBar}) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          color: Color(0xFF323232),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // Added SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    ),
    appBar: appBar,
    bottomNavigationBar: bottomNavigationBar,
  );
}
