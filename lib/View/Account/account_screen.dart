import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/Constants/Size/sizedBox.dart';
import 'package:second_project/Constants/style/textStyle.dart';
import 'package:second_project/View/Account/my_account_tile.dart';
import 'package:second_project/View/Account/my_addresses.dart';
import 'package:second_project/View/Functions/show_dialog_method.dart';

import 'Widgets/circle_avatar_widget.dart';
import 'Widgets/listtile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatarWidget(
                    radius: 50,
                    image: FileImage(
                      File(
                        'assets/images/image_processing20200226-9101-ukr3oz.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              kHeight20,
              Text(
                'Nibu Krishna M V',
                style: nameStyle,
              ),
              kHeight20,
              ListTileWidget(
                icon: Icon(Icons.account_circle),
                title: Text('My Account'),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyAccountTile()),
                    ),
                  );
                },
              ),
              ListTileWidget(
                icon: Icon(Icons.shop_sharp),
                title: Text(
                  'My orders',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: Icon(Icons.list_alt_rounded),
                title: Text(
                  'Addresses',
                  style: listStyle,
                ),
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => MyAddresses())));
                },
              ),
              ListTileWidget(
                icon: Icon(Icons.share_rounded),
                title: Text(
                  'Share',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: Icon(Icons.security_rounded),
                title: Text(
                  'Privacy policy',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: Icon(Icons.policy_rounded),
                title: Text(
                  'Terms and conditions',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: Icon(Icons.logout_rounded),
                title: Text(
                  'Logout',
                  style: listStyle,
                ),
                onPress: () {
                  showDialogMethod(
                    context,
                    Text('Logout'),
                    Text('Do you want to logout'),
                  );
                },
              ),
              kHeight20,
              Text(
                'Version 1.0.0',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.black26,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
