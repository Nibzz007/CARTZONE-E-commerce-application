import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final dynamic category;
  final dynamic image;

  Category({
    required this.category,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'category': category,
        'image': image,
      };

  static Category fromJson(Map<String, dynamic> json) => Category(
        category: json['category'],
        image: json['image'],
      );

      static Stream<List<Category>> getCategories() {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Category')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => Category.fromJson(doc.data()),
            )
            .toList());
  }

  // static Stream<List<Category>> getAllCategories() {
  //   return FirebaseFirestore.instance
  //       .collection('myApp')
  //       .doc('Admin')
  //       .collection('Category')
  //       .snapshots()
  //       .map((
  //         (snapshot) => snapshot.docs.map(
  //           (doc) => Category.fromJson(
  //             doc.data(),
  //           ),
  //         )
  //       )
  //       .toList());
  // }

  static Future<void> addCategory(
      {required String category, required String image}) async {
    final docCategory = FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Category')
        .doc(category);
    final categories = Category(category: category, image: image);
    final json = categories.toJson();
    await docCategory.set(json);
  }
}
