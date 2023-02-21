import 'package:flutter/material.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../Widgets/elvated_button_widget.dart';
import '../Widgets/row_text_widget.dart';
import '../Widgets/text_formField_widget.dart';

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
            children: <Widget> [
              kHeight20,
              const RowTextWidget(text: 'Full name'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your full name',
                icon: Icon(Icons.person),
              ),
              kHeight20,
              const RowTextWidget(text: 'Place'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your place',
                icon: Icon(Icons.place),
              ),
              kHeight20,
              const RowTextWidget(text: 'Phone number'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your phone number',
                icon: Icon(Icons.phone_android),
              ),
              kHeight20,
              const RowTextWidget(text: 'State'),
              kHeight10,
              const TextFormFieldWidget(
                hintText: 'Enter your state',
                icon: Icon(Icons.place_outlined),
              ),
              kHeight20,
              const RowTextWidget(text: 'Pincode'),
              kHeight10,
              const TextFormFieldWidget(
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
