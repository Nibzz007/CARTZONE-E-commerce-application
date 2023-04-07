import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  final Widget icon;
  final Text title;
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
