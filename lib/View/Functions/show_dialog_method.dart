import 'package:flutter/material.dart';
import 'package:second_project/Constants/style/textStyle.dart';

import '../../Colours/colours.dart';
import '../Widgets/text_button_widget.dart';

Future<dynamic> showDialogMethod(BuildContext context, Widget title, Widget content) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kLightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: title,
        content: content,
        actions: [
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
