import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/Colours/colours.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Address/saved_address.dart';
import 'package:second_project/View/Bag/bag.dart';
import 'Widgets/selected_item_elevated_button_widget.dart';

class SelectedItemScreen extends StatefulWidget {
  const SelectedItemScreen({super.key});

  @override
  State<SelectedItemScreen> createState() => _SelectedItemScreenState();
}

class _SelectedItemScreenState extends State<SelectedItemScreen> {
  // final assetImages = [
  //   'assets/images/download (1).jpeg'
  //   'assets/images/macbook-air-og-202206.jpeg'
  //   'assets/images/macbook-air-midnight-select-20220606.jpeg',
  // ];

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: kGrey300,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.4, color: kBlack38),
                  ),
                  child: Image.asset(
                    'assets/images/macbook-air-midnight-select-20220606.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                kHeight20,
                Text(
                  'Apple 2022 MacBook AIR M2 - (8 GB/256 GB SSD/Mac Os Monterery, 13.6 inch, 1.24 Kg)',
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                kHeight10,
                Row(
                  children: [
                    RatingBar.builder(
                      itemSize: 20,
                      minRating: 1,
                      updateOnDrag: true,
                      itemBuilder: ((context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                      onRatingUpdate: ((rating) => setState(() {
                            this.rating = rating;
                          })),
                    ),
                    kWidth10,
                    Text('$rating'),
                    
                  ],
                ),
                kHeight5,
                Row(
                  children: [
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
                      color: kLightGreeen100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //kWidth50,
                      Text(
                        'Price : ₹1,49,900',
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
                  children: [
                    Text(
                      'Highlights',
                      style: priceStyle,
                    ),
                    kHeight10,
                    const Text('* Stylish & Portable Thin and Light Laptop'),
                    kHeight5,
                    const Text(
                        '* 13.6 inch Liquid Retina Display, LED-backlit display with IPS technology, 500 nits brightness, WIde colour()P3, True Tone technology'),
                    kHeight5,
                    const Text('* Light Laptop without Optical Disk Drive')
                  ],
                ),
                kHeight5,
                const Divider(
                  thickness: 2,
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectedItemElevatedButtonWidget(
                      text: 'Add to Cart',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const BagScreen())));
                      },
                      backColor: Colors.white,
                    ),
                    SelectedItemElevatedButtonWidget(
                      text: 'Buy Now',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => SavedAddress())));
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
