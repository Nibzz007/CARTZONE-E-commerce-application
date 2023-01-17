import 'package:flutter/material.dart';
import 'package:second_project/Constants/style/textStyle.dart';

class SelectedItemElevatedButtonWidget extends StatelessWidget {
  SelectedItemElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backColor,
  }) : super(key: key);

  String text;
  final void Function() onPressed;
  Color backColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        fixedSize: const Size(170, 20),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: elvatedTextStyle,
      ),
    );
  }
}
