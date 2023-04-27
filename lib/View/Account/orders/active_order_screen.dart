import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';
import 'package:second_project/model/order_moderl.dart';
import 'package:second_project/view/account/orders/order_container_widget.dart';
import 'package:second_project/view/account/orders/track_order_screen.dart';

class ActiveOrderScreen extends StatelessWidget {
  ActiveOrderScreen({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders.getAllOrders(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          List<Orders> userActiveOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.email == userEmail) {
              if (order.isCompleted == false && order.isCancelled == false) {
                userActiveOrderList.add(order);
              }
            }
          }
          return userActiveOrderList.isEmpty
              ? Center(
                  child: Text('No active orders'),
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    final order = userActiveOrderList[index];
                    return OrderContainer(
                      order: order,
                      delivertStatus: 'In Delivery',
                      orderType: 'Track Order',
                      onTap: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                TrackOrderScreen(order: order)),
                          ),
                        );
                      }),
                    );
                  }),
                  separatorBuilder: ((context, index) => kHeight10),
                  itemCount: userActiveOrderList.length,
                );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
