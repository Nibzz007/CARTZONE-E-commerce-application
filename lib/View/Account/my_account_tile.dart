import 'dart:io';
import 'package:flutter/material.dart';
import 'package:second_project/Colours/colours.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Account/Widgets/circle_avatar_widget.dart';
import 'Widgets/my_account_widget.dart';

class MyAccountTile extends StatelessWidget {
  const MyAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My account',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
        actions: [
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatarWidget(
                        radius: 50,
                        image: FileImage(
                          File(
                            'assets/images/image_processing20200226-9101-ukr3oz.jpg',
                          ),
                        ),
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
              MyAccountWidget(
                text: 'Nibu Krishna M V',
                onPressed: () {},
              ),
              kHeight10,
              MyAccountWidget(
                text: '7907360016',
                onPressed: () {},
              ),
              kHeight10,
              MyAccountWidget(
                text: 'nibukrishna07@gmail.com',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
