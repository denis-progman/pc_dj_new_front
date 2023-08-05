import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_dj_new_front/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PC Studio DJ group',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: MainScreen(),
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        // GetPage(name: '/song', page: () => const SongScreen()),
        // GetPage(name: '/playlist', page: () => const PlaylistScreen()),
      ],
    );
  }
}
