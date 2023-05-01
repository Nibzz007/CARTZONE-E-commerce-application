import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import '../../../view/utils/constants/style/text_style.dart';

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
        backgroundColor: kDeepPurple,
        fixedSize: Size(200.w, 30.h),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: elvatedTextStyle,
      ),
    );
  }
}
