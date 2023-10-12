import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/model/wishlist_model.dart';
import 'package:second_project/view/Home/selected_item_screen.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';
import '../../View/Widgets/text_button_widget.dart';
import '../utils/colours/colours.dart';
import '../utils/constants/style/text_style.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({
    super.key,
  });

  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: WishList.getWishlist(user!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final wishlist = snapshot.data!;
            if (wishlist.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Lottie.asset(
                          'assets/lottie/89039-add-to-favorite.json',
                          frameRate: FrameRate(20)),
                    ),
                    Text(
                      'Your wishlist is empty, add items',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                SelectedItemScreen(product: wishlist[index])),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundColor: kBlack,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            wishlist[index].images[0],
                          ),
                          radius: 40,
                        ),
                      ),
                      title: Text(
                        wishlist[index].productName,
                        style: wishlistTitleStyle,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        '₹ ${wishlist[index].price}',
                        style: TextStyle(
                          fontSize: 15,
                          color: kBlue,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                backgroundColor: kDeepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: Text(
                                  'Remove from wishlist',
                                  style: TextStyle(color: kWhite),
                                ),
                                content: Text(
                                  'Do you want to remove the item from wishlist',
                                  style: TextStyle(color: kWhite),
                                ),
                                actions: [
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
                                      WishList.deleteFromWishlist(
                                        user!,
                                        wishlist[index],
                                      );
                                      Navigator.pop(context);
                                    },
                                    text: Text(
                                      'Yes',
                                      style: confirmationTextStyle,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return kHeight5;
                  },
                  itemCount: wishlist.length,
                ),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
