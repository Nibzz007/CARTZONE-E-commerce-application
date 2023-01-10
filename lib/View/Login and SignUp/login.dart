import 'package:flutter/material.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/BottomNav/bottomNav.dart';
import 'package:second_project/View/Widgets/row_text_widget.dart';
import 'package:second_project/View/Widgets/textFormField_widget.dart';
import 'package:second_project/View/Login%20and%20SignUp/signUp.dart';

import '../Widgets/elvatedButton_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                kHeight200,
                Row(
                  children: [
                    Text(
                      'Login',
                      style: loginStyle,
                    ),
                  ],
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
                ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const BottomNav()),
                      ),
                    );
                  },
                  text: '               Login              ',
                ),
                kHeight10,
                const Text('Or'),
                kHeight10,
                ElevatedButtonWidget(
                  onPressed: () {},
                  text: 'Continue with Google',
                ),
                kHeight40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: loginDonthaveacnt,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const SignUpScreen()),
                          ),
                        );
                      },
                      child: const Text(
                        'Create a new account',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
