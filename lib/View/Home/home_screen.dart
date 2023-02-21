import 'package:flutter/material.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../Bag/bag.dart';
import 'Widgets/category_widget.dart';
import 'Widgets/row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kGrey300,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<StatelessWidget>(
                  builder: (BuildContext context) => const BagScreen(),
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
              children: <Widget> [
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
                  children: <Widget> [
                    Text('Categories', style: categoryStyle),
                  ],
                ),
                kHeight10,
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const <Widget> [
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
