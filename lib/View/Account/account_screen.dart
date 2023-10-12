import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/model/user_model.dart';
import 'package:second_project/view/account/orders/order_screen.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import 'package:share_plus/share_plus.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import '../../View/Widgets/text_button_widget.dart';
import '../../controller/google_sign_in.dart';
//import '../../model/google_sign_in.dart';
import 'widgets/circle_avatar_widget.dart';
import 'widgets/listtile_widget.dart';
import 'my_account_tile.dart';
import 'address/my_addresses.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    // final User user = FirebaseAuth.instance
    //     .currentUser!; // Now we can access the information of the loggedin user

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
              FutureBuilder<UserModel>(
                future: UserModel.getCurrentUserData(email: userEmail!),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  } else if (snapshot.hasData) {
                    final user = snapshot.data!;
                    return Column(
                      children: [
                        CircleAvatarWidget(
                          radius: 60,
                          image: NetworkImage(user.image),
                          // NetworkImage(user.photoURL!),// It will access the photo url of the user
                        ),
                        kHeight20,
                        Text(
                          user.firstName.toUpperCase() +
                              ' ' +
                              user.lastName.toUpperCase(),
                          style: nameStyle,
                        ),
                        kHeight20,
                        ListTileWidget(
                          icon: const Icon(Icons.account_circle),
                          title: Text('My Account',style: listStyle,),
                          onPress: () async {
                            final user = await UserModel.getCurrentUserData(
                              email: userEmail!,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute<StatelessWidget>(
                                builder: (BuildContext context) =>
                                    MyAccountTile(user: user),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
              ),
              ListTileWidget(
                icon: const Icon(Icons.shop_sharp),
                title: Text(
                  'My orders',
                  style: listStyle,
                ),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => OrderScreen()),
                    ),
                  );
                },
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
                      builder: (BuildContext context) => MyAddresses(),
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
                onPress: () async {
                  await Share.share(
                      'Download CARTZONE from Playstore For Free \nWith CARTZONE you purchase mobile phones, tablets and laptops of various brands. Download Now On Playstore');
                },
              ),
              // ListTileWidget(
              //   icon: const Icon(Icons.security_rounded),
              //   title: Text(
              //     'Privacy policy',
              //     style: listStyle,
              //   ),
              //   onPress: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: ((context) =>
              //             SettingsScreenWidget(screenName: 'Privacy Policy')),
              //       ),
              //     );
              //   },
              // ),
              // ListTileWidget(
              //   icon: const Icon(Icons.policy_rounded),
              //   title: Text(
              //     'Terms and conditions',
              //     style: listStyle,
              //   ),
              //   onPress: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: ((context) => SettingsScreenWidget(
              //               screenName: 'Terms And Conditions',
              //             )),
              //       ),
              //     );
              //   },
              // ),
              ListTileWidget(
                icon: const Icon(Icons.logout_rounded),
                title: Text(
                  'Logout',
                  style: listStyle,
                ),
                onPress: () {
                  showDialogMethod(
                    context,
                    Text(
                      'Logout',
                      style: TextStyle(color: kWhite),
                    ),
                    Text(
                      'Do you want to logout',
                      style: TextStyle(color: kWhite),
                    ),
                  );
                },
              ),
              kHeight20,
              Text(
                'Version 1.0.0',
                style: TextStyle(
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

  Future<dynamic> showDialogMethod(
    BuildContext context,
    Widget title,
    Widget content,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kDeepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: title,
          content: content,
          actions: <Widget>[
            TextButtonWidget(
              onPressed: () {
                Navigator.pop(context);
              },
              text: Text(
                'No',
                style: confirmationTextStyle,
              ),
            ),
            TextButtonWidget(
              onPressed: () {
                final GoogleSignInProvider provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logOut();
                Navigator.pop(context);
              },
              text: Text(
                'Yes',
                style: confirmationTextStyle,
              ),
            )
          ],
        );
      },
    );
  }
}
