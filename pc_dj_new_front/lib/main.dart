import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TrackPlayerEvents()),
    ],
    child: const MyApp())
  );
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
        GetPage(name: '/home', page: () => MainScreen()),
        // GetPage(name: '/song', page: () => const SongScreen()),
        // GetPage(name: '/playlist', page: () => const PlaylistScreen()),
      ],
    );
  }
}
