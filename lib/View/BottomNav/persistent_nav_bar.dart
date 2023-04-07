import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../View/Account/account_screen.dart';
import '../../View/Bag/bag.dart';
import '../../View/Home/home_screen.dart';
import '../../View/Wishlist/wishlist_screen.dart';

class BottomNavBarPersistent extends StatefulWidget {
  const BottomNavBarPersistent({super.key});

  @override
  State<BottomNavBarPersistent> createState() => _BottomNavBarPersistentState();
}

class _BottomNavBarPersistentState extends State<BottomNavBarPersistent> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<StatelessWidget> screens = <StatelessWidget>[
    const HomeScreen(),
    const BagScreen(),
    WishlistScreen(),
    ProfileScreen()
  ];

  List<PersistentBottomNavBarItem> navBarItems() => [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          activeColorPrimary: Colors.deepPurple,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          activeColorPrimary: Colors.deepPurple,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          activeColorPrimary: Colors.deepPurple,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_outline_outlined),
          activeColorPrimary: Colors.deepPurple,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        navBarHeight: 60,
        backgroundColor: Color.fromARGB(163, 255, 255, 255),
        screens: screens,
        items: navBarItems(),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle: NavBarStyle
              .style3,
      ),
    );
  }
}
