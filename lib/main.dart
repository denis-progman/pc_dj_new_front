import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/app_router.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/pages/bookmarks_page.dart';
import 'package:pc_dj_new_front/pages/home_page.dart';
import 'package:pc_dj_new_front/pages/local_files_page.dart';
import 'package:pc_dj_new_front/pages/user_cabinet_page.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TrackPlayerEvents()),
  ], child: PCDJApp()));
}

class PCDJApp extends StatefulWidget {
  PCDJApp({super.key});

  @override
  State<PCDJApp> createState() => _PCDJAppState();
}

class _PCDJAppState extends State<PCDJApp> {
  final AudioPlayer audioPlayer = AudioPlayer();
  late TrackPlayer trackPlayer;
  Stream<PlayerSurfBarData> get surfBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, PlayerSurfBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return PlayerSurfBarData(
          position,
          duration ?? Duration.zero,
        );
      }).asBroadcastStream();

  @override
  void initState() {
    super.initState();
    trackPlayer = TrackPlayer(
      audioPlayer: audioPlayer,
      surfBarDataStream: surfBarDataStream,
    );
  }

  @override
  Widget build(BuildContext context) {
    var homePage = HomePage(
      audioPlayer: audioPlayer,
      trackPlayer: trackPlayer,
      surfBarDataStream: surfBarDataStream,
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PC Studio DJ group',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      initialRoute: AppRouter.pageRouts[0].path,
      // home: homePage,
      getPages: [
        GetPage(name: AppRouter.pageRouts[0].path, page: () => homePage),
        GetPage(name: AppRouter.pageRouts[1].path, page: () => BookmarksPage(            
            audioPlayer: audioPlayer,
            trackPlayer: trackPlayer,
            surfBarDataStream: surfBarDataStream,
          ),
        ),
        GetPage(name: AppRouter.pageRouts[2].path, page: () => LocalFilesPage(            
            audioPlayer: audioPlayer,
            trackPlayer: trackPlayer,
            surfBarDataStream: surfBarDataStream,
          ),
        ),
        GetPage(
          name: AppRouter.pageRouts[3].path,
          page: () => UserCabinetPage(
            audioPlayer: audioPlayer,
            trackPlayer: trackPlayer,
            surfBarDataStream: surfBarDataStream,
          ),
        ),
      ],
    );
  }
}
