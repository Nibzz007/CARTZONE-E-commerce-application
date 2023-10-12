import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../view/utils/colours/colours.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import 'package:second_project/model/user_model.dart';
import 'package:second_project/view/utils/show_snack_bar.dart';
import 'package:second_project/view/Account/Widgets/circle_avatar_widget.dart';
import 'package:second_project/view/Widgets/elvated_button_widget.dart';
import 'package:second_project/view/Widgets/text_form_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

XFile? imagePath;
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                kHeight30,
                Center(
                  child: Stack(
                    children: [
                      CircleAvatarWidget(
                        radius: 60,
                        image: imagePath == null
                            ? NetworkImage(widget.user.image)
                            : FileImage(
                                File(imagePath!.path),
                              ) as ImageProvider,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            await pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kWhite),
                            child: Icon(Icons.add_a_photo_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight40,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  hintText: 'First name',
                  icon: Icon(Icons.people),
                  controller: firstNameController,
                  validator: ((value) {
                    if (value != null && value.length < 4) {
                      return 'Enter a valid name';
                    } else {
                      return null;
                    }
                  }),
                ),
                kHeight30,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  hintText: 'Last name',
                  icon: Icon(Icons.people),
                  controller: lastNameController,
                  validator: ((value) {
                    if (value != null && value.length < 2) {
                      return 'Enter a valid last name';
                    } else {
                      return null;
                    }
                  }),
                ),
                kHeight30,
                TextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  hintText: 'Phone number',
                  icon: Icon(Icons.phone_android_outlined),
                  controller: phoneNumberController,
                  validator: ((value) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(pattern);
                    if (value != null && value.isEmpty) {
                      return 'Enter your phone number';
                    } else if (value != null && !regExp.hasMatch(value)) {
                      return 'Enter a valid phone number';
                    } else {
                      return null;
                    }
                  }),
                ),
                kHeight80,
                ElevatedButtonWidget(
                  onPressed: (() async {
                    String? newImage;
                    if (imagePath == null) {
                      setState(() {
                        newImage = widget.user.image;
                      });
                    } else {
                      newImage = await uploadImage();
                      setState(() {});
                    }

                    final newUser = UserModel(
                      email: widget.user.email,
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      phoneNumber: phoneNumberController.text.trim(),
                      image: newImage!,
                    );
                    await UserModel.editUserDetails(user: newUser);
                    showSnackBar(context, 'Profile updated successfully', Colors.deepPurple);
                    setState(() {
                      
                    });
                  }),
                  text: 'Save',
                  color: kDeepPurple,
                ),
              ],
            ),
          ),
        ),
      ),
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
    if (imagePath == null) return '';

    final path = 'file/${imagePath!.name}';
    final file = File(imagePath!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    final imageUploadUrl = snapshot.ref.getDownloadURL();
    return imageUploadUrl;
  }
}
