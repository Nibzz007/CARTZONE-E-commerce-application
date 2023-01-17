import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Colours/colours.dart';
import '../../Constants/Size/sizedBox.dart';
import '../../Constants/style/textStyle.dart';
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
                          TextButtonWidget(
                            onPressed: () {},
                            text: Text('Delete'),
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
