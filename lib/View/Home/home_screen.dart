import 'package:flutter/material.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Bag/bag.dart';
import 'Widgets/category_widget.dart';
import 'Widgets/row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kGrey300,
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const BagScreen()),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_sharp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight20,
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                kHeight10,
                Row(
                  children: [
                    Text('Categories', style: categoryStyle),
                  ],
                ),
                kHeight10,
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryWidget(title: 'Mobiles'),
                      kWidth10,
                      CategoryWidget(title: 'Laptops'),
                      kWidth10,
                      CategoryWidget(title: 'Tablets'),
                      kWidth10,
                      CategoryWidget(title: 'Accessories'),
                      kWidth10,
                    ],
                  ),
                ),
                kHeight10,
                const RowWidget(),
                kHeight10,
                const RowWidget(),
                kHeight10,
                const RowWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
