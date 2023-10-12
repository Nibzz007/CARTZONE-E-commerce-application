import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/model/address_model.dart';
import 'package:second_project/view/account/address/address_form.dart';
import 'package:second_project/view/checkout/shipping_address_screen.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';

class CheckoutAddress extends StatelessWidget {
  CheckoutAddress({
    super.key,
    required this.callBackAddress,
  });

  final user = FirebaseAuth.instance.currentUser!.email;
  final void Function(Address) callBackAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Shipping address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        FutureBuilder<List<Address>>(
          future: Address.getAllAddresses(user!).first,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              final addressList = snapshot.data;
              if (addressList!.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Please add an address to proceed to payment',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => AddressForm()),
                              ),
                            );
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                Address address = Address(
                  addressName: addressList[0].addressName,
                  addressDetails: addressList[0].addressDetails,
                );
                callBackAddress(address);
                return StatefulBuilder(
                  builder: ((context, setState) {
                    final screenHeight = MediaQuery.of(context).size.height;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: screenHeight * 0.15,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 0.3,
                            color: kDeepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: kWhite,
                                child: Icon(
                                  Icons.location_on,
                                  color: kDeepPurple,
                                ),
                              ),
                              title: Text(address.addressName),
                              subtitle: Text(address.addressDetails),
                            ),
                            Divider(thickness: 0.8),
                            GestureDetector(
                              onTap: (() async {
                                final addressName =
                                    await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => ShippingAddress()),
                                  ),
                                );
                                for (var item in addressList) {
                                  if (item.addressName == addressName) {
                                    setState(() {
                                      address = Address(
                                        addressName: item.addressName,
                                        addressDetails: item.addressDetails,
                                      );
                                    });
                                  }
                                }
                                callBackAddress(address);
                              }),
                              child: Text(
                                'Change address',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ],
    );
  }
}
