import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Login%20and%20SignUp/login.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/5191079.jpeg'),
                    ),
                  ),
                ),
                kHeight20,
                Row(
                  children: [
                    Text(
                      'Enter OTP',
                      style: signupStyle,
                    ),
                  ],
                ),
                kHeight20,
                const Text(
                  'A six digit OTP has been sent to your phone number +91 ******3331',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                ),
                kHeight40,
                Pinput(
                  length: 6,
                ),
                kHeight40,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => LogInScreen()
                        ),
                      ),
                    );
                  },
                  child: Text('Continue'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
