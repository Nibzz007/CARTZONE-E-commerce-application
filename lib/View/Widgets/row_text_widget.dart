import 'package:flutter/material.dart';

import '../../Constants/style/textStyle.dart';

class RowTextWidget extends StatelessWidget {
  RowTextWidget({
    Key? key, required this.text
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: loginSubStyle,
        ),
      ],
    );
  }
}