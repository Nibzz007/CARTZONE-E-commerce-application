import 'package:flutter/material.dart';
import 'package:second_project/model/address_model.dart';
import 'package:second_project/view/account/address/payment_screen.dart';
import 'package:second_project/view/checkout/checkout_address.dart';
import 'package:second_project/view/checkout/checkout_order.dart';
import 'package:second_project/view/checkout/total_amount.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';
import 'package:second_project/view/utils/constants/style/text_style.dart';
import 'package:second_project/view/widgets/elvated_button_widget.dart';
import '../../model/cart_model.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.gst,
  });

  final List<Cart> cartItems;
  final double gst;
  Address address = Address(addressName: '', addressDetails: '');
  void getAddress(Address newAddress) {
    address = newAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckoutAddress(
                    callBackAddress: getAddress,
                  ),
                  kHeight10,
                  CheckoutOrder(
                    cartItems: cartItems,
                  ),
                  kHeight20,
                  Divider(),
                  TotalAmount(
                    cartItems: cartItems,
                    gst: gst,
                  ),
                  kHeight20,
                  ElevatedButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => PaymentScreen(
                                address: address,
                                cartItems: cartItems,
                                gst: gst,
                              )),
                        ),
                      );
                    },
                    text: 'Continue to payment',
                    color: kDeepPurple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
