import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/Size/sized_box.dart';
import '../../Constants/style/text_style.dart';
import '../Functions/show_dialog_method.dart';
import 'Widgets/circle_avatar_widget.dart';
import 'Widgets/listtile_widget.dart';
import 'my_account_tile.dart';
import 'my_addresses.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance
        .currentUser!; // Now we can access the information of the loggedin user

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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatarWidget(
                    radius: 50,
                    image: 
                    Image.asset(
                      'assets/images/image_processing20200226-9101-ukr3oz.jpg',
                    ).image,
                    // NetworkImage(user.photoURL!),// It will access the photo url of the user
                  ),
                ],
              ),
              kHeight20,
              
              Text(
                'nibu',
                //user.displayName!,
                style: nameStyle,
              ),
              kHeight20,
              ListTileWidget(
                icon: const Icon(Icons.account_circle),
                title: const Text('My Account'),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatelessWidget>(
                      builder: (BuildContext context) => const MyAccountTile(),
                    ),
                  );
                },
              ),
              ListTileWidget(
                icon: const Icon(Icons.shop_sharp),
                title: Text(
                  'My orders',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: const Icon(Icons.list_alt_rounded),
                title: Text(
                  'Addresses',
                  style: listStyle,
                ),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatelessWidget>(
                      builder: (BuildContext context) => const MyAddresses(),
                    ),
                  );
                },
              ),
              ListTileWidget(
                icon: const Icon(Icons.share_rounded),
                title: Text(
                  'Share',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: const Icon(Icons.security_rounded),
                title: Text(
                  'Privacy policy',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: const Icon(Icons.policy_rounded),
                title: Text(
                  'Terms and conditions',
                  style: listStyle,
                ),
                onPress: () {},
              ),
              ListTileWidget(
                icon: const Icon(Icons.logout_rounded),
                title: Text(
                  'Logout',
                  style: listStyle,
                ),
                onPress: () {
                  showDialogMethod(
                    context,
                    const Text('Logout'),
                    const Text('Do you want to logout'),
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
