import 'package:flutter/material.dart';
import 'package:second_project/model/cart_model.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';

class TotalAmount extends StatelessWidget {
  TotalAmount({super.key, required this.cartItems, required this.gst});

  final List<Cart> cartItems;
  final double gst;
  int amount = 0;
  double includingGst = 0;

  void getTotalAmount() {
    for (var item in cartItems) {
      amount = amount + (item.price * item.itemCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    getTotalAmount();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 0.3,
            color: kDeepPurple,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '${amount}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              kHeight20,
              Divider(),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${amount + gst}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
