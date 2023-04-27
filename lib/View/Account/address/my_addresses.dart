import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/model/address_model.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import '../../Account/address/address_form.dart';
import '../../Widgets/text_button_widget.dart';

class MyAddresses extends StatelessWidget {
  MyAddresses({super.key});

  final user = FirebaseAuth.instance.currentUser!.email;

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
                      builder: (BuildContext context) => AddressForm(),
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
              Expanded(
                child: StreamBuilder(
                  stream: Address.getAllAddresses(user!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Something went wrong'),
                      );
                    } else if (snapshot.hasData) {
                      final addressList = snapshot.data;
                      if (addressList!.isEmpty) {
                        return Center(
                          child: Text('No addresses'),
                        );
                      } else {
                        return ListView.separated(
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 130,
                              width: double.infinity,
                              //color: kLightBlue,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: kBlack38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Shipping information',
                                            style: checkOutHeadStyle,
                                          ),
                                        ),
                                        // TextButtonWidget(
                                        //   onPressed: () {
                                        //     Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute<StatelessWidget>(
                                        //         builder: (BuildContext context) => AddressForm(),
                                        //       ),
                                        //     );
                                        //   },
                                        //   text: const Text('Edit'),
                                        // ),
                                        TextButtonWidget(
                                          onPressed: () async {
                                            await Address.deleteAddress(
                                                user!, addressList[index]);
                                          },
                                          text: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                    kHeight10,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        addressList[index].addressName,
                                        style: checkOutAddressStyle,
                                      ),
                                    ),
                                    kHeight5,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        addressList[index].addressDetails,
                                        style: checkOutAddressStyle,
                                      ),
                                    ),
                                    kHeight5,
                                    // Text(
                                    //   '+234 9011039271',
                                    //   style: checkOutAddressStyle,
                                    // )
                                  ],
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: ((context, index) => kHeight20),
                          itemCount: addressList.length,
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
