import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_project/model/product_model.dart';

class WishList {
  static Future<void> addToWishlist(String user, Product product) async {
    final wishDoc = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Wishlist')
        .doc(product.productName);

    final json = product.toJson();
    await wishDoc.set(json);
  }

  static Future<void> deleteFromWishlist(String user, Product product) async {
    await FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Wishlist')
        .doc(product.productName)
        .delete();
  }

  static Stream<List<Product>> getWishlist(String user) {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Wishlist')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (docs) => Product.fromJson(
                  docs.data(),
                ),
              )
              .toList(),
        );
  }
}
