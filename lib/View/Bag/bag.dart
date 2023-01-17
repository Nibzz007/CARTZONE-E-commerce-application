import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/Colours/colours.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Address/saved_address.dart';
import 'package:second_project/View/Widgets/elvatedButton_widget.dart';
import 'package:second_project/View/Widgets/text_button_widget.dart';

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
            children: [
              MyCartWidget(),
              kHeight10,
              MyCartWidget(),
              kHeight20,
              Divider(
                thickness: 2,
              ),
              kHeight10,
              Row(
                children: [
                  Text(
                    'Price details',
                    style: myCartSubtitileStyle,
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Price'),
                  Text('₹1,40,000'),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Delivery charge'), Text('₹40')],
              ),
              kHeight10,
              Divider(
                thickness: 2,
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Total amount'), Text('₹1,40,040')],
              ),
              kHeight40,
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => SavedAddress()
                      ),
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
