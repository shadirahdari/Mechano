import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CheckBoxTile.dart';
import 'package:flutter_application_1/components/Spacer.dart';
import 'package:flutter_application_1/components/TitleText2.dart';
import 'package:flutter_application_1/components/Button2.dart';

void showReasonModal(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Stack(children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Red background
                  ),
                  height: 430,
                  padding: EdgeInsets.all(16), // Internal padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Space(1),
                      TitleText2('What is your problem?', fontSize: 18),
                      Space(),
                      StatefulCheckboxTile(
                        title: "Battery",
                        onChanged: (value) {
                          print("Battery is $value");
                        },
                      ),
                      StatefulCheckboxTile(
                        title: "Electricity",
                        onChanged: (value) {
                          print("Electric is $value");
                        },
                      ),
                      StatefulCheckboxTile(
                        title: "Tier",
                        onChanged: (value) {
                          print("Tier is $value");
                        },
                      ),
                      StatefulCheckboxTile(
                        title: "Not Sure",
                        onChanged: (value) {
                          print("Not Sure is $value");
                        },
                      ),
                      StatefulCheckboxTile(
                        title: "Others",
                        onChanged: (value) {
                          print("Others is $value");
                        },
                      ),
                      Space(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Button2(
                          "Submit Reason",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ))
            ]));
      });
}
