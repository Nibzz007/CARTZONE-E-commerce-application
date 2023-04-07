import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/model/product_model.dart';
import '../../colours/colours.dart';
import '../../constants/size/sized_box.dart';
import '../../constants/style/text_style.dart';
import '../Address/saved_address.dart';
import '../Bag/bag.dart';
import 'Widgets/selected_item_elevated_button_widget.dart';

class SelectedItemScreen extends StatefulWidget {
  SelectedItemScreen({
    super.key,
    required this.product,
  });

  Product product;

  @override
  State<SelectedItemScreen> createState() => _SelectedItemScreenState();
}

class _SelectedItemScreenState extends State<SelectedItemScreen> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.images[0],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.8,
                      color: kBlack38,
                    ),
                  ),
                ),
                kHeight20,
                Text(
                  widget.product.productName,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                kHeight10,
                Row(
                  children: <Widget>[
                    RatingBar.builder(
                      itemSize: 20,
                      minRating: 1,
                      updateOnDrag: true,
                      itemBuilder: (BuildContext context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double rating) => setState(() {
                        this.rating = rating;
                      }),
                    ),
                    kWidth10,
                    Text('$rating'),
                  ],
                ),
                kHeight5,
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.fire_truck,
                      color: kLightBlue,
                    ),
                    kWidth10,
                    const Text('FREE Delivery')
                  ],
                ),
                kHeight20,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: kBlack38),
                    borderRadius: BorderRadius.circular(5),
                    color: kLightGreeen100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //kWidth50,
                      Text(
                        widget.product.price,
                        style: priceStyle,
                      )
                    ],
                  ),
                ),
                kHeight5,
                const Divider(
                  thickness: 2,
                ),
                kHeight5,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Highlights',
                      style: priceStyle,
                    ),
                    kHeight10,
                    Text(
                      widget.product.description,
                      style: TextStyle(height: 2, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                kHeight5,
                const Divider(
                  thickness: 2,
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SelectedItemElevatedButtonWidget(
                      text: 'Add to Cart',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<StatelessWidget>(
                            builder: (BuildContext context) =>
                                const BagScreen(),
                          ),
                        );
                      },
                      backColor: Colors.white,
                    ),
                    SelectedItemElevatedButtonWidget(
                      text: 'Buy Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<StatelessWidget>(
                            builder: (BuildContext context) =>
                                const SavedAddress(),
                          ),
                        );
                      },
                      backColor: Colors.yellow,
                    )
                  ],
                ),

                // CarouselSlider.builder(
                //   itemCount: assetImages.length,
                //   itemBuilder: ((context, index, realIndex) {
                //     final assetImage = assetImages[index];

                //     return buildImage(assetImage, index);
                //   }),
                //   options: CarouselOptions(
                //     height: 200,
                //     viewportFraction: 1
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String assetImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: kGrey300,
      child: Image.asset(
        assetImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
