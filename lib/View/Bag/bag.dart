import 'package:flutter/material.dart';
import '../../Colours/colours.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../Address/saved_address.dart';
import '../Widgets/elvated_button_widget.dart';

import 'Widgets/my_cart_widget.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const MyCartWidget(),
              kHeight10,
              const MyCartWidget(),
              kHeight20,
              const Divider(
                thickness: 2,
              ),
              kHeight10,
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
                children: const <Widget>[
                  Text('Price'),
                  Text('₹1,40,000'),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Delivery charge'),
                  Text('₹40'),
                ],
              ),
              kHeight10,
              const Divider(
                thickness: 2,
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget> [
                  Text('Total amount'),
                  Text('₹1,40,040'),
                ],
              ),
              kHeight40,
              ElevatedButtonWidget(
                color: kBlack,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatelessWidget>(
                      builder: (BuildContext context) => const SavedAddress(),
                    ),
                  );
                },
                text: 'Checkout',
              )
            ],
          ),
        ),
      ),
    );
  }
}
