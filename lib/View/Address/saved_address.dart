import 'package:flutter/material.dart';
import 'package:second_project/Colours/colours.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Address/address_form.dart';
import 'package:second_project/View/Address/successful_screen.dart';
import 'package:second_project/View/Widgets/elvatedButton_widget.dart';
import 'package:second_project/View/Widgets/text_button_widget.dart';

class SavedAddress extends StatefulWidget {
  SavedAddress({super.key});

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => AddressForm()),
                    ),
                  );
                },
                leading: Icon(Icons.add),
                title: Text('Add new address'),
              ),
              Divider(
                thickness: 2,
              ),
              kHeight10,
              Container(
                height: 150,
                width: double.infinity,
                //color: kLightBlue,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: kBlack38),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping information',
                            style: checkOutHeadStyle,
                          ),
                          TextButtonWidget(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => AddressForm()),
                                ),
                              );
                            },
                            text: Text('Edit'),
                          ),
                        ],
                      ),
                      kHeight10,
                      Text(
                        'John Doe',
                        style: checkOutAddressStyle,
                      ),
                      kHeight5,
                      Text(
                        '43 Oxford Road M13 4GR Manchester, UK',
                        style: checkOutAddressStyle,
                      ),
                      kHeight5,
                      Text(
                        '+234 9011039271',
                        style: checkOutAddressStyle,
                      )
                    ],
                  ),
                ),
              ),
              kHeight20,
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  //color: kGrey300,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: kBlack38),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Payment methods',
                            style: checkOutHeadStyle,
                          ),
                        ],
                      ),
                      kHeight5,
                      Column(
                        children: [
                          RadioListTile<int>(
                            value: 0,
                            groupValue: selectedValue,
                            title: Text('RazorPay'),
                            onChanged: (value) => setState(() {
                              selectedValue = 0;
                            }),
                          ),
                          RadioListTile<int>(
                            value: 1,
                            groupValue: selectedValue,
                            title: Text('Cash on delivery'),
                            onChanged: (value) => setState(() {
                              selectedValue = 1;
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              kHeight80,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: loginSubStyle,
                  ),
                  Text(
                    '₹1,40,040',
                    style: loginSubStyle,
                  ),
                ],
              ),
              kHeight40,
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => SuccessfulScreen()),
                    ),
                  );
                },
                text: 'Confirm and Pay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
