import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false, required this.controller, required this.validator,
  });

  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
       
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w200),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
