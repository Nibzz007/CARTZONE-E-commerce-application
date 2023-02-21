import 'package:flutter/material.dart';
import '../../Constants/style/text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
 const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 40),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: elvatedButtonTextStyle,
      ),
    );
  }
}
