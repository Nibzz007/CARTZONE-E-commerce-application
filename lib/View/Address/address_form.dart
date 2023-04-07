import 'package:flutter/material.dart';
import '../../colours/colours.dart';
import '../../constants/size/sized_box.dart';
import '../../constants/style/text_style.dart';
import '../Widgets/elvated_button_widget.dart';
import '../Widgets/row_text_widget.dart';
import '../Widgets/text_form_field_widget.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                kHeight20,
                const RowTextWidget(text: 'Full name'),
                kHeight10,
                TextFormFieldWidget(
                  validator: (p0) {
                    
                  },
                  hintText: 'Enter your full name',
                  icon: const Icon(Icons.person),
                  controller: fullNameController,
                ),
                kHeight20,
                const RowTextWidget(text: 'Place'),
                kHeight10,
                TextFormFieldWidget(
                  validator: ((p0) {
                    
                  }),
                  hintText: 'Enter your place',
                  icon: const Icon(Icons.place),
                  controller: placeController,
                ),
                kHeight20,
                const RowTextWidget(text: 'Phone number'),
                kHeight10,
                TextFormFieldWidget(
                  validator: (p0) {
                    
                  },
                  hintText: 'Enter your phone number',
                  icon: const Icon(Icons.phone_android),
                  controller: phoneNumberController,
                ),
                kHeight20,
                const RowTextWidget(text: 'State'),
                kHeight10,
                TextFormFieldWidget(validator: (p0) {
                  
                },
                  hintText: 'Enter your state',
                  icon: const Icon(Icons.place_outlined),
                  controller: stateController,
                ),
                kHeight20,
                const RowTextWidget(text: 'Pincode'),
                kHeight10,
                TextFormFieldWidget(
                  validator: (p0) {
                    
                  },
                  hintText: 'Enter your pincode',
                  icon: const Icon(Icons.pin),
                  controller: pinCodeController,
                ),
                kHeight40,
                ElevatedButtonWidget(
                  color: kBlack,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Save'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
