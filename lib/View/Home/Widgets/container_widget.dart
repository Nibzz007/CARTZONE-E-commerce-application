import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Colours/colours.dart';
import '../../../Constants/Size/sized_box.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.image,
    required this.onPress,
  });

  final Widget image;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 220,
        width: 180,
        decoration: BoxDecoration(
            //color: kLightBlue,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: kBlack38, width: 0.3)),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              image,
              Positioned(
                child: Row(
                  children: <Widget> [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline_outlined,
                        color: kRed,
                      ),
                    ),
                  ],
                ),
              )
            ]),
            Text(
              'Apple MacBook Air M2\n     512 Gb, 8Gb RAM',
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
            kHeight10,
            Text(
              '₹1,40,000',
              style: GoogleFonts.montserrat(
                  fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
