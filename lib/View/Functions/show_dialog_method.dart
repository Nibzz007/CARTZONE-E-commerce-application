import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Colours/colours.dart';
import '../../Constants/style/text_style.dart';
import '../../Model/google_sign_in.dart';
import '../Widgets/text_button_widget.dart';

Future<dynamic> showDialogMethod(
  BuildContext context,
  Widget title,
  Widget content,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kLightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: title,
        content: content,
        actions: <Widget>[
          TextButtonWidget(
            onPressed: () {
              Navigator.pop(context);
            },
            text: Text(
              'No',
              style: confirmationTextStyle,
            ),
          ),
          TextButtonWidget(
            onPressed: () {
              final GoogleSignInProvider provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logOut();
              Navigator.pop(context);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute<StatelessWidget>(
              //     builder: (BuildContext context) => const LogInScreen(),
              //   ),
              // );
            },
            text: Text(
              'Yes',
              style: confirmationTextStyle,
            ),
          )
        ],
      );
    },
  );

}
