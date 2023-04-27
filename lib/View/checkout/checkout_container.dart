import 'package:flutter/material.dart';
import 'package:second_project/model/cart_model.dart';
import 'package:second_project/view/checkout/checkout_screen.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/style/text_style.dart';
import '../../View/Widgets/elvated_button_widget.dart';
import '../../view/utils/constants/size/sized_box.dart';

class CheckoutContainer extends StatelessWidget {
  CheckoutContainer({
    super.key,
    required this.cartItems,
  });

  final List<Cart> cartItems;
  int totalPrice = 0;

  void getCartQuantityAndPrice() {
    for (var item in cartItems) {
      totalPrice = totalPrice + (item.itemCount * item.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    getCartQuantityAndPrice();
    dynamic gst = totalPrice * (18 / 100);

    return Column(
      children: [
        Row(
          children: <Widget>[
            Text(
              'Price details',
              style: myCartSubtitileStyle,
            ),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Total Price'),
            Text('₹ ${totalPrice.toString()}'),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('GST'),
            Text('₹ ${gst.toString()}'),
          ],
        ),
        kHeight10,
        const Divider(
          thickness: 2,
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Total amount'),
            Text('₹ ${totalPrice + gst}'),
          ],
        ),
        kHeight40,
        ElevatedButtonWidget(
          color: kDeepPurple,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<StatelessWidget>(
                builder: (BuildContext context) => CheckoutScreen(
                  cartItems: cartItems,
                  gst: gst,
                ),
              ),
            );
          },
          text: 'Checkout',
        ),
      ],
    );
  }
}
