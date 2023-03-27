import 'package:flutter/material.dart';
import '../../Colours/colours.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../Widgets/elvated_button_widget.dart';
import '../Widgets/text_button_widget.dart';
import 'address_form.dart';
import 'successful_screen.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<StatelessWidget>(
                        builder: (BuildContext context) => const AddressForm(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.add),
                  title: const Text('Add new address'),
                ),
                const Divider(
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
                      children: <Widget> [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Text(
                              'Shipping information',
                              style: checkOutHeadStyle,
                            ),
                            TextButtonWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<StatelessWidget>(
                                    builder: (BuildContext context) => const AddressForm(),
                                  ),
                                );
                              },
                              text: const Text('Edit'),
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
                      children: <Widget> [
                        Row(
                          children: <Widget> [
                            Text(
                              'Payment methods',
                              style: checkOutHeadStyle,
                            ),
                          ],
                        ),
                        kHeight5,
                        Column(
                          children: <Widget> [
                            RadioListTile<int>(
                              value: 0,
                              groupValue: selectedValue,
                              title: const Text('RazorPay'),
                              onChanged: (int? value) => setState(() {
                                selectedValue = 0;
                              }),
                            ),
                            RadioListTile<int>(
                              value: 1,
                              groupValue: selectedValue,
                              title: const Text('Cash on delivery'),
                              onChanged: (int? value) => setState(() {
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
                  children: <Widget> [
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
                  color: kBlack,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<StatelessWidget>(
                        builder: (BuildContext context) => const SuccessfulScreen(),
                      ),
                    );
                  },
                  text: 'Confirm and Pay',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
