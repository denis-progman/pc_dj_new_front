import 'package:flutter/material.dart';
// import 'package:pc_dj_new_front/styles/styles.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: const Icon(Icons.grid_view_rounded),
      actions: [
        // Container(
        //   margin: const EdgeInsets.only(right: 20),
        //   child: const CircleAvatar(
        //     backgroundImage: AssetImage(
        //       'assets/images/default/dj_avatar.jpg',
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(5.0);
}