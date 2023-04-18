import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/view/bag/checkout_container.dart';
import '../../constants/size/sized_box.dart';
import '../../constants/style/text_style.dart';
import '../../model/cart_model.dart';
import 'Widgets/my_cart_widget.dart';

class BagScreen extends StatelessWidget {
  BagScreen({
    super.key,
    required this.getQuantity,
  });

  final Function(int) getQuantity;

  final user = FirebaseAuth.instance.currentUser!.email;

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
      body: StreamBuilder<List<Cart>>(
        stream: Cart.getCartItems(user!),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final cartItems = snapshot.data;
            if (cartItems!.isEmpty) {
              return Center(
                child: Text('The cart is empty'),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      MyCartWidget(
                        cartItems: cartItems,
                        getQuantity: getQuantity,
                        currentQuantity: 1,
                      ),
                      kHeight20,
                      const Divider(
                        thickness: 2,
                      ),
                      kHeight10,
                      CheckoutContainer(
                        cartItems: cartItems,
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
