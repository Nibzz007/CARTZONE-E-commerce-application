import 'package:flutter/material.dart';
import 'package:second_project/view/utils/colours/colours.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.icon,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.onChanged, required this.keyboardType});

  final String hintText;
  final Widget icon;
  final bool obscureText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: kBlack38,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kDeepPurple, width: 2),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w200,
            color: kBlack38,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
