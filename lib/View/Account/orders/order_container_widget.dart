import 'package:flutter/material.dart';
import 'package:second_project/constants/size/sized_box.dart';
import 'package:second_project/model/order_moderl.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
    required this.order,
    required this.delivertStatus,
    this.isVisible = true,
    required this.onTap, required this.orderType
  });

  final Orders order;
  final String delivertStatus;
  final bool isVisible;
  final Function() onTap;
  final String orderType;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.12,
            width: screenHeight * 0.12,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(order.image),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          kWidth10,
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.135,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.productName,
                  ),
                  Text('Quantity : ${order.cartCount}'),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(delivertStatus),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ ${order.price.toString()}.00',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: GestureDetector(
                          onTap: onTap,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(orderType),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
