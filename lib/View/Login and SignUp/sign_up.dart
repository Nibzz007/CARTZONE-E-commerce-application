import 'package:flutter/material.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../OTP/otp_screen.dart';

import '../Widgets/row_text_widget.dart';
import '../Widgets/text_formField_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              kHeight40,
              Row(
                children: <Widget>[
                  kHeight40,
                  Text(
                    'Create a new account',
                    style: signupStyle,
                  ),
                ],
              ),
              kHeight20,
              const RowTextWidget(text: 'Name'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your name',
                icon: Icon(Icons.person),
              ),
              kHeight20,
              const RowTextWidget(text: 'Email'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your email',
                icon: Icon(Icons.email_outlined),
              ),
              kHeight20,
              const RowTextWidget(text: 'Password'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your password',
                icon: Icon(Icons.password_outlined),
              ),
              kHeight20,
              const RowTextWidget(text: 'Confirm Password'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Confirm password',
                icon: Icon(Icons.password_outlined),
              ),
              kHeight20,
              const RowTextWidget(text: 'Mobile number'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your mobile number',
                icon: Icon(Icons.mobile_friendly_outlined),
              ),
              kHeight20,
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<StatelessWidget>(
                      builder: (BuildContext context) => const OtpScreen(),
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
