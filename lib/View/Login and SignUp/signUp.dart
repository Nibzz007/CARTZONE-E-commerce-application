import 'package:flutter/material.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/OTP/otpScreen.dart';

import '../Widgets/row_text_widget.dart';
import '../Widgets/textFormField_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              kHeight80,
              Row(
                children: [
                  kHeight40,
                  Text(
                    'Create a new account',
                    style: signupStyle,
                  ),
                ],
              ),
              kHeight20,
              RowTextWidget(text: 'Name'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your name',
                icon: const Icon(Icons.person),
              ),
              kHeight20,
              RowTextWidget(text: 'Email'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your email',
                icon: const Icon(Icons.email_outlined),
              ),
              kHeight20,
              RowTextWidget(text: 'Password'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your password',
                icon: const Icon(Icons.password_outlined),
              ),
              kHeight20,
              RowTextWidget(text: 'Mobile number'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your mobile number',
                icon: const Icon(Icons.mobile_friendly_outlined),
              ),
              kHeight20,
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const OtpScreen()),
                    ),
                  );
                },
                child: const Text(
                  'Create',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
