import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/main.dart';
import 'package:second_project/model/cart_model.dart';
import 'package:second_project/model/product_model.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/show_snack_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import '../bag/bag.dart';
import 'widgets/selected_item_elevated_button_widget.dart';

class SelectedItemScreen extends StatefulWidget {
  const SelectedItemScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<SelectedItemScreen> createState() => _SelectedItemScreenState();
}

class _SelectedItemScreenState extends State<SelectedItemScreen> {
  bool isClicked = true;
  int activeIndex = 0;
  int quantity = 1;

  getQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 225,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.4,
                      color: kDeepPurple,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: widget.product.images.length,
                        itemBuilder: ((context, index, realIndex) {
                          final String assetImage =
                              widget.product.images[index];
                          return buildImage(assetImage, index);
                        }),
                        options: CarouselOptions(
                            height: 200,
                            viewportFraction: 1,
                            onPageChanged: ((index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            })),
                      ),
                      kHeight5,
                      buildIndicator(),
                    ],
                  ),
                ),
                kHeight20,
                Text(
                  widget.product.productName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kHeight10,
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
                        '₹ ${widget.product.price}',
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
                      style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.w500,
                      ),
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
                    isClicked
                        ? SelectedItemElevatedButtonWidget(
                            text: 'Add to Cart',
                            onPressed: () async {
                              setState(() {
                                isClicked = false;
                              });
                              showDialog(
                                context: context,
                                builder: ((context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }),
                              );
                              await Cart.addToCart(
                                user: user!,
                                productName: widget.product.productName,
                                image: widget.product.images[0],
                                price: widget.product.price,
                                itemCount: quantity,
                              );
                              showSnackBar(
                                context,
                                'Product added to Cart successfully',
                                Colors.deepPurple,
                              );
                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                            },
                            backColor: Colors.white,
                          )
                        : SelectedItemElevatedButtonWidget(
                            text: 'Go to cart',
                            onPressed: () async {
                              setState(() {
                                isClicked = true;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute<StatelessWidget>(
                                  builder: (BuildContext context) => BagScreen(
                                    getQuantity: getQuantity,
                                  ),
                                ),
                              );
                            },
                            backColor: Colors.white,
                          ),
                  ],
                ),
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(assetImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.product.images.length,
      effect: JumpingDotEffect(
        activeDotColor: kDeepPurple,
        dotHeight: 10,
        dotWidth: 15,
      ),
    );
  }
}
