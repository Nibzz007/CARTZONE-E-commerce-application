import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Widgets/elvatedButton_widget.dart';
import 'package:second_project/View/Widgets/row_text_widget.dart';
import 'package:second_project/View/Widgets/textFormField_widget.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new address',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              kHeight20,
              RowTextWidget(text: 'Full name'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your full name',
                icon: Icon(Icons.person),
              ),
              kHeight20,
              RowTextWidget(text: 'Place'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your place',
                icon: Icon(Icons.place),
              ),
              kHeight20,
              RowTextWidget(text: 'Phone number'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your phone number',
                icon: Icon(Icons.phone_android),
              ),
              kHeight20,
              RowTextWidget(text: 'State'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your state',
                icon: Icon(Icons.place_outlined),
              ),
              kHeight20,
              RowTextWidget(text: 'Pincode'),
              kHeight10,
              TextFormFieldWidget(
                hintText: 'Enter your pincode',
                icon: Icon(Icons.pin),
              ),
              kHeight40,
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Save'),
            ],
          ),
        ),
      ),
    );
  }
}
