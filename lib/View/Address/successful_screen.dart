import 'package:flutter/material.dart';
import '../../Colours/colours.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../BottomNav/bottom_navigation.dart';
import '../Widgets/elvated_button_widget.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey300,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Order successful',
                  style: loginStyle,
                ),
                kHeight20,
                Text(
                  'Your order will be delivered soon\nThank you for choosing our app!',
                  style: loginSubStyle,
                ),
                kHeight40,
                ElevatedButtonWidget(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<StatelessWidget>(
                          builder: (BuildContext context) => const BottomNav(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    text: 'Continue Shopping')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
