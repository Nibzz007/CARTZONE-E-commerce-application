import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Colours/colours.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import 'Widgets/circle_avatar_widget.dart';
import 'Widgets/my_account_widget.dart';

class MyAccountTile extends StatelessWidget {
  const MyAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My account',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          kWidth10
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatarWidget(
                        radius: 50,
                        image: Image.asset(
                                'assets/images/image_processing20200226-9101-ukr3oz.jpg')
                            .image,
                        //NetworkImage(user.photoURL!),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 10,
                        //left: 50,
                        child: IconButton(
                          iconSize: 25,
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: kWhite,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              kHeight20,
              const MyAccountWidget(
                text: 'Nibu'
                //user.displayName!,
                // onPressed: () {},
              ),
              kHeight10,
              MyAccountWidget(
                text: user.email!
                //user.email!,
                // onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
