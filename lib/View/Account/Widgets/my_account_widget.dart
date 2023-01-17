import 'package:flutter/material.dart';

import '../../../Colours/colours.dart';
import '../../../Constants/style/textStyle.dart';

class MyAccountWidget extends StatelessWidget {
  MyAccountWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kBlack38),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: listStyle,
            ),
            // IconButton(
            //   iconSize: 10,
            //   onPressed: onPressed,
            //   icon: Icon(
            //     Icons.edit,
            //     size: 25,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
