import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_dj_new_front/app_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    this.ofTopWidget = const Column(),
  }) : super(key: key);
  final Widget ofTopWidget;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ofTopWidget,
      BottomNavigationBar(
        onTap: (routIndex) => {
          Get.toNamed(AppRouter.pageRouts[routIndex].path)
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 22,
        items: <BottomNavigationBarItem>[
          for(var rout in AppRouter.pageRouts) BottomNavigationBarItem(
            label: rout.label,
            icon: rout.icon,
          )
        ],
      ),
    ]);
  }
}
