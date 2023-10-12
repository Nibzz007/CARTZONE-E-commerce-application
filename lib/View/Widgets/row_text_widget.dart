import 'package:flutter/material.dart';

import '../utils/constants/style/text_style.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key, required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Text(
          text,
          style: loginSubStyle,
        ),
      ],
    );
  }
}
