import 'package:flutter/material.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import '../../utils/constants/style/text_style.dart';

class MyAccountWidget extends StatelessWidget {
  const MyAccountWidget({
    super.key,
    required this.text,
    //required this.onPressed,
  });

  final String text;
  //final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kBlack38,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
