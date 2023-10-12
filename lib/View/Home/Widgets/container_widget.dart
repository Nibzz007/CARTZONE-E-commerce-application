import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/main.dart';
import 'package:second_project/model/product_model.dart';
import 'package:second_project/model/wishlist_model.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/show_snack_bar.dart';
import '../../utils/constants/size/sized_box.dart';
import '../selected_item_screen.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.product,
  });

  final Product product;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SelectedItemScreen(product: product),
          ),
        );
      },
      child: Container(
        height: 220,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: kDeepPurple,
            width: 0.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: <Widget>[
                        StreamBuilder(
                          stream: WishList.getWishlist(user!),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Something went wrong'),
                              );
                            } else if (snapshot.hasData) {
                              final wishlist = snapshot.data;
                              return GestureDetector(
                                onTap: () async {
                                  // showDialog(
                                  //   context: context,
                                  //   builder: ((context) {
                                  //     return const Center(
                                  //       child: CircularProgressIndicator(),
                                  //     );
                                  //   }),
                                  //   barrierDismissible: false,
                                  // );
                                  if (wishlist
                                      .where((element) =>
                                          element.productName ==
                                          product.productName)
                                      .isEmpty) {
                                    await WishList.addToWishlist(
                                        user!, product);
                                    showSnackBar(
                                        context,
                                        'Product added to wishlist',
                                        Colors.deepPurple);
                                  } else {
                                    await WishList.deleteFromWishlist(
                                        user!, product);
                                    showSnackBar(
                                      context,
                                      'Product Removed from wishlist',
                                      Colors.deepPurple,
                                    );
                                  }
                                  navigatorKey.currentState!
                                      .popUntil((route) => route.isFirst);
                                },
                                child: wishlist!
                                        .where((element) =>
                                            element.productName ==
                                            product.productName)
                                        .isEmpty
                                    ? Icon(
                                        Icons.favorite_border,
                                        color: kBlack,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: kRed,
                                      ),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.productName,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '₹ ${product.price}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
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
