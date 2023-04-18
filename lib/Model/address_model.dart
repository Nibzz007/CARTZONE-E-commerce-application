import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  final String addressName;
  final String addressDetails;

  Address({
    required this.addressName,
    required this.addressDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': addressName,
      'details': addressDetails,
    };
  }

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
      addressName: json['name'],
      addressDetails: json['details'],
    );
  }

  static Future<void> addNewAddress({
    required String user,
    required String addressName,
    required String addressDetails,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Address')
        .doc(addressName);

    final address = Address(
      addressName: addressName,
      addressDetails: addressDetails,
    );

    final json = address.toJson();
    await docUser.set(json);
  }

  static Future<void> deleteAddress(
    String user,
    Address address,
  ) async {
    await FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Address')
        .doc(address.addressName)
        .delete();
  }

  static Future<void> updateAddress({
    required Address newAddress,
    required String user,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Address')
        .doc(newAddress.addressName);

    final json = newAddress.toJson();
    await docUser.update(json);
  }

  static Stream<List<Address>> getAllAddresses(String user) {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Address')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Address.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
