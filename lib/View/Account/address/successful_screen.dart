import 'package:flutter/material.dart';
import 'package:second_project/view/Home/home_screen.dart';
import '../../../colours/colours.dart';
import '../../../constants/size/sized_box.dart';
import '../../../constants/style/text_style.dart';
import '../../Widgets/elvated_button_widget.dart';

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
                  color: kBlack,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<StatelessWidget>(
                          builder: (BuildContext context) => HomeScreen(),
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
