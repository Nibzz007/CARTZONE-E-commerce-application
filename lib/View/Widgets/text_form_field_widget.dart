import 'package:flutter/material.dart';
import 'package:second_project/colours/colours.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    required this.validator,
  });

  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color.fromARGB(128, 131, 136, 91),
        borderRadius: BorderRadius.circular(8),
      ),
      //color: Color.fromARGB(255, 75, 129, 13),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: kWhite,
          hintText: hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.w200, color: kBlack38),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
