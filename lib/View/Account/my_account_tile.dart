import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/model/user_model.dart';
import 'package:second_project/view/Account/edit_profile_screen.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import 'widgets/circle_avatar_widget.dart';
import 'widgets/my_account_widget.dart';

class MyAccountTile extends StatefulWidget {
  MyAccountTile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<MyAccountTile> createState() => _MyAccountTileState();
}

class _MyAccountTileState extends State<MyAccountTile> {

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My account',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final user =
                  await UserModel.getCurrentUserData(email: userEmail!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => EditProfileScreen(
                        user: user,
                      )),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          kWidth10,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              kHeight80,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatarWidget(
                        radius: 60,
                        image: NetworkImage(widget.user.image),
                      ),
                    ],
                  ),
                ],
              ),
              kHeight30,
              MyAccountWidget(
                text: widget.user.firstName + ' ' + widget.user.lastName,
              ),
              kHeight30,
              MyAccountWidget(
                text: widget.user.email,
              ),
              kHeight30,
              MyAccountWidget(
                text: widget.user.phoneNumber,
              )
            ],
          ),
        ),
      ),
    );
  }
}
