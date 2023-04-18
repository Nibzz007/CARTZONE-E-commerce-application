import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_model.dart';

class Orders {
  final String orderId;
  final String productName;
  final String image;
  final int price;
  final int cartCount;
  final String payment;
  final String address;
  final String email;
  final int deliveryType;
  final bool isCompleted;
  final bool isCancelled;

  Orders({
    required this.orderId,
    required this.productName,
    required this.image,
    required this.price,
    required this.cartCount,
    required this.payment,
    required this.address,
    required this.email,
    this.deliveryType = 0,
    this.isCompleted = false,
    this.isCancelled = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productName': productName,
      'image': image,
      'price': price,
      'cartCount': cartCount,
      'payment': payment,
      'address': address,
      'email': email,
      'deliveryType': deliveryType,
      'isCompleted': isCompleted,
      'isCancelled': isCancelled,
    };
  }

  static Orders fromJson(Map<String, dynamic> json) {
    return Orders(
      orderId: json['orderId'],
      productName: json['productName'],
      image: json['image'],
      price: json['price'],
      cartCount: json['cartCount'],
      payment: json['payment'],
      address: json['address'],
      email: json['email'],
      deliveryType: json['deliveryType'],
      isCompleted: json['isCompleted'],
      isCancelled: json['isCancelled'],
    );
  }

  static Future<void> addOrder({
    required String email,
    required String id,
    required Cart cartItem,
    required int price,
    required String payment,
    required String address,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Orders')
        .doc(id);

    final newOrder = Orders(
      orderId: id,
      productName: cartItem.productName,
      image: cartItem.image,
      price: price,
      cartCount: cartItem.itemCount,
      payment: payment,
      address: address,
      email: email,
    );

    final json = newOrder.toJson();
    await docUser.set(json);
  }

  static Future<void> cancelOrder({required Orders order}) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Orders')
        .doc(order.orderId)
        .delete();

    // final newOrder = Orders(
    //   orderId: order.orderId,
    //   productName: order.productName,
    //   image: order.image,
    //   price: order.price,
    //   cartCount: order.cartCount,
    //   payment: order.payment,
    //   address: order.address,
    //   email: order.email,
    //   isCompleted: order.isCompleted,
    //   deliveryType: order.deliveryType,
    //   isCancelled: true,
    // );

    // final json = newOrder.toJson();
    //docUser.
  }

  static Future<void> updateOrder({
    required Orders order,
    required int newProcess,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Orders')
        .doc(order.orderId);

    final newOrder = Orders(
      orderId: order.orderId,
      productName: order.productName,
      image: order.image,
      price: order.price,
      cartCount: order.cartCount,
      payment: order.payment,
      address: order.address,
      email: order.email,
      isCompleted: (newProcess <= 3) ? false : true,
      deliveryType: newProcess,
    );

    final json = newOrder.toJson();
    await docUser.update(json);
  }

  static Stream<List<Orders>> getAllOrders() {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Orders')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Orders.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
