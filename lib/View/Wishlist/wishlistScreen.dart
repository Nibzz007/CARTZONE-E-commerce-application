import 'package:flutter/material.dart';
import 'package:second_project/Colours/colours.dart';
import 'package:second_project/Constants/style/textStyle.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: ((context, index) {
            return ListTile(
              leading: SizedBox(
                height: 200,
                width: 80,
                child: Image.asset(
                  'assets/images/download.jpeg',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Apple iPhone 13',
                style: wishlistTitleStyle,
              ),
              subtitle: Text(
                '₹ 70,000',
                style: TextStyle(
                  fontSize: 15,
                  color: kBlue,
                ),
              ),
              trailing: const Icon(Icons.delete)
            );
          }),
          separatorBuilder: ((context, index) {
            return const Divider();
          }),
          itemCount: 10,
        ),
      ),
    );
  }
}
