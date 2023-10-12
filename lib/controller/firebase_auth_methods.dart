import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/view/utils/show_snack_bar.dart';
import '../View/Login and SignUp/login.dart';

class FirebaseAuthMethods {
  FirebaseAuthMethods(this._auth);
  final FirebaseAuth _auth;

  // E-Mail Sign Up

  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext
          context // it is used to display a snackbar. We have to use context to use the Scaffold Messenger because Firebase authmethod class is not stateless ot stateful widget
      }) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (UserCredential value) => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => const LogInScreen()
              ),
              (Route<dynamic> route) => false,
            ),
          );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, Colors.red);
    }
  }
}
