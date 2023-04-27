import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/view/functions/show_dialog_method.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/style/text_style.dart';
import 'package:second_project/view/widgets/elvated_button_widget.dart';
import 'package:second_project/view/widgets/text_button_widget.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../model/cart_model.dart';

class MyCartWidget extends StatefulWidget {
  MyCartWidget({
    super.key,
    required this.cartItems,
    required this.getQuantity,
    required this.currentQuantity,
  });

  final List<Cart> cartItems;
  final Function(int) getQuantity;
  final int currentQuantity;

  @override
  State<MyCartWidget> createState() => _MyCartWidgetState();
}

class _MyCartWidgetState extends State<MyCartWidget> {
  late int quantity = widget.currentQuantity;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 155,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.2),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 90,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: kGrey300,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.3),
                        image: DecorationImage(
                          image: NetworkImage(widget.cartItems[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  kWidth10,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.cartItems[index].productName,
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        kHeight10,
                        Text(
                          '₹ ${widget.cartItems[index].price}',
                          style: GoogleFonts.montserrat(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        kHeight10,
                        Row(
                          children: [
                            const Text('Quantity'),
                            kWidth10,
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: kGrey300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: quantity < 2
                                    ? Icon(Icons.remove)
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity = quantity - 1;
                                            widget.getQuantity(quantity);
                                          });
                                          Cart.updateCart(
                                            cartItem: widget.cartItems[index],
                                            quantity: quantity,
                                            user: user!,
                                          );
                                          log(quantity.toString());
                                        },
                                        child: const Icon(Icons.remove),
                                      ),
                              ),
                            ),
                            kWidth10,
                            Text(
                              quantity.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            kWidth10,
                            Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: kGrey300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = quantity + 1;
                                      widget.getQuantity(quantity);
                                    });
                                    Cart.updateCart(
                                      cartItem: widget.cartItems[index],
                                      quantity: quantity,
                                      user: user!,
                                    );
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                        kHeight8,
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return AlertDialog(
                                        backgroundColor: kDeepPurple,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        title: Text(
                                          'Remove from cart',
                                          style: TextStyle(color: kWhite),
                                        ),
                                        content: Text(
                                          'Do you want to remove the item from cart',
                                          style: TextStyle(color: kWhite),
                                        ),
                                        actions: [
                                          TextButtonWidget(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            text: Text(
                                              'No',
                                              style: confirmationTextStyle,
                                            ),
                                          ),
                                          TextButtonWidget(
                                            onPressed: () {
                                              Cart.deleteCartItem(
                                                user: user!,
                                                cartItem:
                                                    widget.cartItems[index],
                                              );
                                              Navigator.pop(context);
                                            },
                                            text: Text(
                                              'Yes',
                                              style: confirmationTextStyle,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                                icon: Icon(Icons.delete_outline),
                                label: Text('Remove'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kDeepPurple),
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
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: widget.cartItems.length,
        ),
      ),
    );
  }
}
