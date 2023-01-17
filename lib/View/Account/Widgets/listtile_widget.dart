import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  Widget icon;
  Text title;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: title,
      onTap: onPress,
    );
  }
}
