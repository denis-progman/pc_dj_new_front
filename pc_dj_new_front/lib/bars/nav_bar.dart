import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';
// import 'package:pc_dj_new_front/styles/styles.dart';

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const TrackPlayer(),
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Profile',
          ),
        ],
      ),
    ]);
  }
}
