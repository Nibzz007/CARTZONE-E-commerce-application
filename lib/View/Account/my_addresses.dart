import 'package:flutter/material.dart';
import '../../Colours/colours.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../Address/address_form.dart';
import '../Widgets/text_button_widget.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My addresses',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: <Widget>[
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
                          TextButtonWidget(
                            onPressed: () {},
                            text: const Text('Delete'),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
