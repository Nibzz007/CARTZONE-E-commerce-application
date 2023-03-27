import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late GoogleSignInAccount?
      _user;
  GoogleSignInAccount get user =>
      _user!; 

  Future<dynamic> googleLogIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn
          .signIn(); 
      if (googleUser == null) {
        return;
      }
      _user = googleUser;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners(); // To update the UI
  }

  Future<dynamic> logOut() async {
    // await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
