import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/main.dart';
import 'package:second_project/view/utils/constants/style/text_style.dart';
import '../../controller/firebase_auth_methods.dart';
import '../utils/colours/colours.dart';
import 'package:second_project/model/user_model.dart';

import '../../View/Widgets/row_text_widget.dart';
import '../../View/Widgets/text_form_field_widget.dart';
import '../utils/constants/size/sized_box.dart';
//import '../../model/firebase_auth_methods.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 219, 210, 210),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  kHeight20,
                  Row(
                    children: <Widget>[
                      kHeight40,
                      Text(
                        'Enter your details',
                        style: signupStyle,
                      ),
                    ],
                  ),
                  kHeight20,
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.black26,
                        backgroundImage: imagePath == null
                            ? null
                            : FileImage(
                                File(imagePath!.path),
                              ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.add_a_photo_outlined,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  kHeight20,
                  const RowTextWidget(text: 'First Name'),
                  kHeight20,
                  TextFormFieldWidget(
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value != null && value.length < 4) {
                        return 'Enter a valid name';
                      } else {
                        return null;
                      }
                    },
                    controller: firstNameController,
                    hintText: 'Enter your first name',
                    icon: const Icon(Icons.person),
                  ),
                  kHeight20,
                  const RowTextWidget(text: 'Last Name'),
                  kHeight20,
                  TextFormFieldWidget(
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value != null && value.length < 2) {
                        return 'Enter a valid last name';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Enter your last name',
                    icon: const Icon(Icons.person),
                    controller: lastNameController,
                  ),
                  kHeight20,
                  const RowTextWidget(text: 'Phone number'),
                  kHeight20,
                  TextFormFieldWidget(
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    validator: (String? value) {
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = RegExp(pattern);
                      if (value != null && value.isEmpty) {
                        return 'Enter your phone number';
                      } else if (value != null && !regExp.hasMatch(value)) {
                        return 'Enter a valid phone number';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Enter your phone number',
                    icon: Icon(Icons.phone_android),
                    controller: phoneNumberController,
                  ),
                  kHeight50,
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                      );
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      signUpUser(context);
                      // navigatorKey.currentState!
                      //     .popUntil((route) => route.isFirst);
                    },
                    child: const Text(
                      'Create',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser(BuildContext context) async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: widget.email,
      password: widget.password,
      context: context,
    );
    final image = await uploadImage();
    await UserModel.createUser(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      email: widget.email,
      image: image,
    );
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    setState(() {
      imagePath = image;
    });
  }

  Future<String> uploadImage() async {
    if (imagePath == null) {
      return '';
    }
    final path = 'file/${imagePath!.name}';
    final file = File(imagePath!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    final imageDownloadUrl = snapshot.ref.getDownloadURL();

    return imageDownloadUrl;
  }
}
