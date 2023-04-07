import 'package:flutter/material.dart';
import 'package:second_project/model/product_model.dart';
import '../../colours/colours.dart';
import '../../constants/style/text_style.dart';
import '../Functions/show_dialog_method.dart';
import '../Home/selected_item_screen.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key, });

  

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
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute<StatelessWidget>(
                  //     builder: (BuildContext context) =>
                  //         SelectedItemScreen(product: product,),
                  //   ),
                  // );
                },
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
                trailing: IconButton(
                  onPressed: () {
                    showDialogMethod(
                      context,
                      const Text('Remove from Wishlist'),
                      const Text('Are you sure ?'),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
