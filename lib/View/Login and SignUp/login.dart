import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:second_project/view/BottomNav/persistent_nav_bar.dart';
import '../../colours/colours.dart';
import '../../constants/size/sized_box.dart';
import '../../constants/style/text_style.dart';
import '../../model/google_sign_in.dart';
import '../../main.dart';
import '../../utils/show_snack_bar.dart';
import '../BottomNav/bottom_navigation.dart';
import '../Widgets/elvated_button_widget.dart';
import '../Widgets/row_text_widget.dart';
import '../Widgets/text_form_field_widget.dart';
import 'sign_up.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong..Please try again'),
            );
          } else if (snapshot.hasData) {
            return const BottomNavBarPersistent();
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        kHeight10,
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Lottie.asset(
                            'assets/lottie/111594-login.json',
                          ),
                        ),
                        kHeight40,
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
                        TextFormFieldWidget(
                          validator: (String? value) {
                            return value != null &&
                                    !EmailValidator.validate(value)
                                ? 'Enter a valid email'
                                : null;
                          },
                          hintText: 'Enter your email',
                          icon: const Icon(Icons.email_outlined),
                          controller: emailController,
                        ),
                        kHeight20,
                        const RowTextWidget(text: 'Password'),
                        kHeight10,
                        TextFormFieldWidget(
                          validator: (String? value) {
                            if (value != null && value.length < 6) {
                              return 'Password requires a minimum 6 characters';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Enter your password',
                          obscureText: true,
                          icon: const Icon(Icons.password_outlined),
                          controller: passwordController,
                        ),
                        kHeight20,
                        ElevatedButtonWidget(
                          color: kBlack,
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            signIn();
                          },
                          text: 'Login',
                        ),
                        kHeight10,
                        const Text('Or'),
                        kHeight10,
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 40),
                            backgroundColor: kWhite,
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            final GoogleSignInProvider provider =
                                Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false,
                            );
                            provider.googleLogIn();
                          },
                          label: Text(
                            'Sign in With Google',
                            style: TextStyle(
                              color: kBlack,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, 'E-mail or Password is incorrect');
    }
    navigatorKey.currentState!
        .popUntil((Route<dynamic> route) => route.isFirst);
    //used to hide the showdialog after signing into firebase
  }
}
