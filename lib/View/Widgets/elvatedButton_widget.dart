import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final void Function() onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
