import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/model/address_model.dart';
import 'package:second_project/view/account/address/address_form.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';
import 'package:second_project/view/widgets/elvated_button_widget.dart';
import '../../View/utils/colours/colours.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final user = FirebaseAuth.instance.currentUser!.email;
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change address'),
      ),
      body: StreamBuilder(
        stream: Address.getAllAddresses(user!),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final addressList = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: addressList!.isEmpty
                        ? Center(
                            child: Text('No addresses'),
                          )
                        : Column(
                            children: [
                              ListView.separated(
                                padding: EdgeInsets.all(10),
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all()),
                                    child: Center(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: kWhite,
                                          child: Icon(
                                            Icons.location_on,
                                            color: kDeepPurple,
                                          ),
                                        ),
                                        title: Text(
                                            addressList[index].addressName),
                                        subtitle: Text(
                                            addressList[index].addressDetails),
                                        trailing: Radio(
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                              (states) => kDeepPurple,
                                            ),
                                            value:
                                                addressList[index].addressName,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value!;
                                              });
                                            }),
                                      ),
                                    ),
                                  );
                                }),
                                separatorBuilder: ((context, index) {
                                  return Divider();
                                }),
                                itemCount: addressList.length,
                              ),
                              kHeight30,
                              ElevatedButtonWidget(
                                onPressed: () {
                                  Navigator.pop(context, selectedValue);
                                  setState(() {});
                                },
                                text: 'Apply',
                                color: kDeepPurple,
                              ),
                            ],
                          ),
                  ),
                  ElevatedButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => AddressForm()),
                        ),
                      );
                    },
                    text: 'Add new address',
                    color: kDeepPurple,
                  ),
                  kHeight20,
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
