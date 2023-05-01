import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:second_project/view/bottomNav/persistent_nav_bar.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order successful',
                      style: successStyle,
                    ),
                  ],
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
                    Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: ((context) => BottomNavBarPersistent()),
                        ),
                        (route) => false);
                  },
                  text: 'Continue Shopping',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
