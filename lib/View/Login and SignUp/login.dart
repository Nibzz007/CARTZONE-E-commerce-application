import 'package:flutter/material.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../BottomNav/bottom_navigation.dart';
import '../Widgets/elvated_button_widget.dart';
import '../Widgets/row_text_widget.dart';
import '../Widgets/text_formField_widget.dart';
import 'sign_up.dart';

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
              children: <Widget>[
                kHeight200,
                Row(
                  children: <Widget>[
                    Text(
                      'Login',
                      style: loginStyle,
                    ),
                  ],
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
                  obscureText: true,
                  icon: Icon(Icons.password_outlined),
                ),
                kHeight20,
                ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<StatelessWidget>(
                        builder: (BuildContext context) => const BottomNav(),
                      ),
                    );
                  },
                  text: 'Login',
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
                  children: <Widget>[
                    Text(
                      "Don't have an account ?",
                      style: loginDonthaveacnt,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<StatelessWidget>(
                            builder: (BuildContext context) =>
                                const SignUpScreen(),
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
