import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import '../../controller/google_sign_in.dart';
import '../utils/constants/style/text_style.dart';
//import '../../model/google_sign_in.dart';
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
        backgroundColor: kDeepPurple,
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
