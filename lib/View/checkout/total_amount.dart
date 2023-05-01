import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        width: double.infinity.w,
        height: 150.h,
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
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '₹ ${amount}',
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              kHeight20,
              Divider(),
              kHeight10,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kWidth10,
                  Text(
                    '( + 18% GST)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  kWidth60,
                  Text(
                    '₹ ${amount + gst}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
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
