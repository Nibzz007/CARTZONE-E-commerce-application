import 'package:flutter/material.dart';
import 'package:second_project/model/cart_model.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';

class CheckoutOrder extends StatelessWidget {
  const CheckoutOrder({
    super.key,
    required this.cartItems,
  });

  final List<Cart> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Order details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        kHeight10,
        ListView.separated(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: ((context, index) {
            final item = cartItems[index];
            return Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.3, color: kDeepPurple),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: double.infinity,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(item.image),
                      ),
                    ),
                  ),
                  title: Text(item.productName),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.itemCount.toString()),
                      Text('₹ ${item.price * item.itemCount}'),
                    ],
                  ),
                ),
              ),
            );
          }),
          separatorBuilder: ((context, index) => kHeight10),
          itemCount: cartItems.length,
        ),
      ],
    );
  }
}
