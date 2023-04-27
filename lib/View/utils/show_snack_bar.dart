import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: Duration(seconds: 1),
    ),
  );
}

