import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:second_project/Colours/colours.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/BottomNav/bottomNav.dart';
import 'package:second_project/View/Widgets/elvatedButton_widget.dart';

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
              children: [
                Text('Order successful', style: loginStyle,),
                kHeight20,
                Text("Your order will be delivered soon\nThank you for choosing our app!", style: loginSubStyle,),
                kHeight40,
                ElevatedButtonWidget(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => BottomNav())), (route) => false);
                }, text: 'Continue Shopping')
              ],
            ),
          ),
        ),
      ),
    );
  }
}