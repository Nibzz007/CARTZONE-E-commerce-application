import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Colours/colours.dart';
import '../../../Constants/Size/sizedBox.dart';

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.2)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 130,
              height: double.infinity,
              decoration: BoxDecoration(
                color: kGrey300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/images/My project (6).png'),
            ),
          ),
          kWidth10,
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Macbook Air M2\n512 Gb, 8Gb RAM, 13.3''",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                kHeight10,
                Text(
                  '₹1,40,000',
                  style: GoogleFonts.montserrat(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
                kHeight10,
                Row(
                  children: [
                    Text('Quantity'),
                    kWidth10,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: kLightBlue),
                      child: Center(
                        child: Text(
                          '-',
                          style: GoogleFonts.montserrat(
                            color: kBlack,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    kWidth10,
                    Text('1'),
                    kWidth10,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: kLightBlue),
                      child: Center(
                        child: Text(
                          '+',
                          style: GoogleFonts.montserrat(
                            color: kBlack,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
