import 'package:flutter/material.dart';
import '../../../Constants/style/text_style.dart';

class SelectedItemElevatedButtonWidget extends StatelessWidget {
 const SelectedItemElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backColor,
  });

  final String text;
  final void Function() onPressed;
  final Color backColor;
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
