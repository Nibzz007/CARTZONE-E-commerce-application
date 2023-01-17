import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  CircleAvatarWidget({
    Key? key,
    required this.radius,
    required this.image,
  }) : super(key: key);

  double radius;
  ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: image,
    );
  }
}
