import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String image;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'image': image,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
    );
  }

  static Future<void> createUser({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String image,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(email);

    final user = UserModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      image: image,
    );

    final json = user.toJson();
    await docUser.set(json);
  }

  static Future<UserModel> getCurrentUserData({required String email}) async {
    final docUser = await FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(email)
        .get();

    return UserModel.fromJson(docUser.data()!);
  }

  static Future<void> editUserDetails({required UserModel user}) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user.email);

    final json = user.toJson();
    await docUser.update(json);
  }

  static Stream<List<UserModel>> getAllUsers() {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (docs) => UserModel.fromJson(
                  docs.data(),
                ),
              )
              .toList(),
        );
  }
}
