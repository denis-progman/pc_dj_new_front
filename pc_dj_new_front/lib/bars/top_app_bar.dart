import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/widgets/header.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key, 
    this.flexibleSpaceBar = const Column(),
  });

  final Widget flexibleSpaceBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      forceMaterialTransparency: true,
      flexibleSpace: Column(
        children: [
          SizedBox(height: 50,),
          Header(),
          flexibleSpaceBar,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
