import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';
import 'package:second_project/model/order_moderl.dart';
import 'package:second_project/view/account/orders/order_container_widget.dart';

class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({
    super.key,
    required this.order,
  });

  final Orders order;

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Order Placed",
      ),
      subtitle: StepperText("Your order has been placed"),
    ),
    StepperData(
      title: StepperText(
        "Packed",
      ),
      subtitle: StepperText("Your order is being prepared"),
    ),
    StepperData(
      title: StepperText(
        "Out for Delivery",
      ),
      subtitle: StepperText(
        "Our delivery executive is on the way to deliver your item",
      ),
    ),
    StepperData(
      title: StepperText(
        "Delivered",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track order'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderContainer(
                order: order,
                delivertStatus: 'In Delivery',
                onTap: () {},
                orderType: '',
              ),
              kHeight20,
              Text('Order status details'),
              AnotherStepper(
                activeIndex: order.deliveryType,
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                verticalGap: 50,
                activeBarColor: kBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
