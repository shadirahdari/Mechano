import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/LabelText.dart';
import 'package:flutter_application_1/components/Spacer.dart';


  AppBar NavBar() {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.red),
              ),
              Space(),
              LabelText(
                'Full Name',
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.alarm, color: Colors.white),
            onPressed: () {
            
            },
          ),
        ],
      ),
    );
  }

 