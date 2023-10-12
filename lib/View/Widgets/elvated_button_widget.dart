import 'package:flutter/material.dart';
import '../utils/constants/style/text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  final void Function() onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          //fixedSize: const Size(250, 40),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: elvatedButtonTextStyle,
        ),
      ),
    );
  }
}
