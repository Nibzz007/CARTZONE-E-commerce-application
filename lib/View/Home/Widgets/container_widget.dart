import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/model/product_model.dart';
import '../../../colours/colours.dart';
import '../../../constants/size/sized_box.dart';
import '../../../view/Home/selected_item_screen.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.product,
  });
 
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => SelectedItemScreen(
                  product: product,
                )),
          ),
        );
      },
      child: Container(
        height: 220,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: kBlack38,
            width: 0.3,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          product.images[0],
                        ),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: <Widget>[
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
                ],
              ),
            ),
            kHeight5,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    product.productName,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            kHeight10,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    product.price,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
