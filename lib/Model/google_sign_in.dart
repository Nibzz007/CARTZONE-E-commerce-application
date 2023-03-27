import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late GoogleSignInAccount?
      _user; // Field for user that has signed in. This holds all the information about the user such as  profile pic, name and email
  GoogleSignInAccount get user =>
      _user!; // Getter method to get the  Google sign in account and using this we can access all the datas of the user like pic,name etc.

  Future<dynamic> googleLogIn() async {
    //This method is executed every time when we click on the Google sign in button
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn
          .signIn(); // Call the Googel sign in pop up with user account
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
