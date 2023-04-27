import 'package:flutter/material.dart';
import 'package:second_project/view/utils/constants/style/text_style.dart';
import 'package:second_project/view/account/orders/active_order_screen.dart';
import 'package:second_project/view/account/orders/completed_order_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: appBarTitleStyle,
          ),
          centerTitle: true,
          bottom: TabBar(
            labelPadding: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            tabs: [
              Text('Active'),
              Text('Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveOrderScreen(),
            CompletedOrderScreen(),
          ],
        ),
      ),
    );
  }
}
