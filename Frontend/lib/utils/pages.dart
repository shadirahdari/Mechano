import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/ForgetEmailPage.dart';
import 'package:flutter_application_1/Screen/ForgetPasswordPhonePage.dart';
import 'package:flutter_application_1/Screen/HomePage.dart';
import 'package:flutter_application_1/Screen/LoginPage.dart';
import 'package:flutter_application_1/Screen/SignedUpWelcomeP.dart';
import 'package:flutter_application_1/Screen/SignupPage.dart';
import 'package:flutter_application_1/Screen/Wellcome_page.dart';

Function(BuildContext) navigateToPage(Widget Function() page) {
  return (BuildContext context) {
    return () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page()),
        );
  };
}

Map<String, Function(BuildContext)> pages = {
  'Home': navigateToPage(() => HomePage()),
  'Login': navigateToPage(() => LoginPage()),
  'SignUp': navigateToPage(() => SignupPage()),
  'ForgetPassword': navigateToPage(() => WellcomePage()),
  'SignedupWelcome': navigateToPage(() => SignedUpWelcomeP()),
  'ForgetEmail': navigateToPage(() => ForgetEmailPage()),
  'ForgetPassPhone': navigateToPage(() => Forgetpasswordphonepage()),
  
  
};

extension NavigatorExtension on Map<String, Function(BuildContext)> {
  Function(BuildContext) get Home => this['Home']!;
  Function(BuildContext) get Login => this['Login']!;
  Function(BuildContext) get SignUp => this['SignUp']!;
  Function(BuildContext) get ForgetPassword => this['ForgetPassword']!;
  Function(BuildContext) get SignedupWelcome => this['SignedupWelcome']!;
  Function(BuildContext) get ForgetEmailPage => this['ForgetEmail']!;
  Function(BuildContext) get Forgetpasswordphonepage=> this['ForgetPassPhone']!;
  Function(BuildContext) get RequestReasonPage=> this['RequestReason']!;
}
