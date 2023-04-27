import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import '../Login%20and%20SignUp/login.dart';

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
              children: <Widget> [
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
                  children: <Widget> [
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
                const Pinput(
                  length: 6,
                ),
                kHeight40,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute <StatelessWidget> (
                        builder: (BuildContext context) => const LogInScreen()
                        ,
                      ),
                    );
                  },
                  child: const Text('Continue'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
