import 'package:flutter/material.dart';
import '../../../Constants/Size/sized_box.dart';
import '../selected_item_screen.dart';
import 'container_widget.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ContainerWidget(
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute <StatelessWidget> (
                builder: (BuildContext context) => const SelectedItemScreen(),
              ),
            );
          },
          image: Image.asset(
            'assets/images/My project (6).png',
            height: 140,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        kWidth10,
        ContainerWidget(
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute <StatelessWidget> (
                builder: (BuildContext context) => const SelectedItemScreen(),
              ),
            );
          },
          image: Image.asset(
            'assets/images/My project (6).png',
            height: 140,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
