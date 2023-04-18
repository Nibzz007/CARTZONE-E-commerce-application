import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/model/wishlist_model.dart';
import 'package:second_project/view/Home/selected_item_screen.dart';
import '../../colours/colours.dart';
import '../../constants/style/text_style.dart';

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
                child: Text('Wishlist is empty'),
              );
            } else {
              return Container(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
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
                          backgroundImage: NetworkImage(
                            wishlist[index].images[0],
                          ),
                          radius: 40,
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
                            await WishList.deleteFromWishlist(user!, wishlist[index]);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
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
