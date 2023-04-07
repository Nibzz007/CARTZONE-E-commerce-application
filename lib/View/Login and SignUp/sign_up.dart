import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/view/Login%20and%20SignUp/user_details.dart';
import '../../constants/size/sized_box.dart';
import '../../constants/style/text_style.dart';
import '../../model/firebase_auth_methods.dart';
import '../Widgets/row_text_widget.dart';
import '../Widgets/text_form_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Lottie.asset(
                      'assets/lottie/28497-profile-icon.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                  kHeight10,
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
                  const RowTextWidget(text: 'Email'),
                  kHeight10,
                  TextFormFieldWidget(
                    validator: (String? value) {
                      return value != null && !EmailValidator.validate(value)
                          ? 'Enter a valid email'
                          : null;
                    },
                    hintText: 'Enter your email',
                    icon: const Icon(Icons.email_outlined),
                    controller: signUpEmailController,
                  ),
                  kHeight20,
                  const RowTextWidget(text: 'Password'),
                  kHeight10,
                  TextFormFieldWidget(
                    obscureText: true,
                    validator: (String? value) {
                      if (value != null && value.length < 6) {
                        return 'Password requires a minimum 6 characters';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Enter your password',
                    icon: const Icon(Icons.password_outlined),
                    controller: signUpPasswordController,
                  ),
                  kHeight20,
                  const RowTextWidget(text: 'Confirm Password'),
                  kHeight10,
                  TextFormFieldWidget(
                    obscureText: true,
                    validator: (String? value) {
                      if (value != null && value.length < 6) {
                        return 'Paswword requires minimum 6 charachter';
                      } else if (signUpPasswordController.text !=
                          signUpConfirmPasswordController.text) {
                        return 'Password does not match';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Confirm password',
                    icon: const Icon(Icons.password_outlined),
                    controller: signUpConfirmPasswordController,
                  ),
                  // kHeight20,
                  // const RowTextWidget(text: 'Mobile number'),
                  // kHeight10,
                  //  TextFormFieldWidget(
                  //   hintText: 'Enter your mobile number',
                  //   icon: const Icon(Icons.mobile_friendly_outlined), text: phoneNumberController,
                  // ),
                  kHeight20,
                  ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      //signUpUser();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => UserDetailsScreen(
                            email: signUpEmailController.text.trim().toLowerCase(),
                            password: signUpPasswordController.text.trim(),
                          )
                          ),
                        ),
                      );
                    },
                    //onPressed: signUpUser,
                    // () {
                    //   FirebaseAuth.instance
                    //       .createUserWithEmailAndPassword(
                    //         email: signUpEmailController.text,
                    //         password: signUpPasswordController.text,
                    //       )
                    //       .then((UserCredential value) =>
                    //           Navigator.of(context).pushReplacement(
                    //             MaterialPageRoute<StatelessWidget>(
                    //               builder: (BuildContext context) =>
                    //                   const LogInScreen(),
                    //             ),
                    //           ));
                    // },
                    child: const Text(
                      'Create',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
