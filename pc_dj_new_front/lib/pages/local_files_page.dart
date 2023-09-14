import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/bars/nav_bar.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/pages/screen_wrapper.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';

class LocalFilesPage extends StatelessWidget {
  LocalFilesPage({
    super.key, 
    required this.audioPlayer, 
    required this.trackPlayer, 
    required this.surfBarDataStream
  });
  final AudioPlayer audioPlayer;
  final TrackPlayer trackPlayer;
  final Stream<PlayerSurfBarData> surfBarDataStream;

  final List<Track> trackList = TrackStorage.galleryTrackList;

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          forceMaterialTransparency: true,
          flexibleSpace: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text("LOCAL FILES PLAYER", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: NavBar(ofTopWidget: trackPlayer),
        body: SingleChildScrollView(
          physics: null,
          child: Column(
            children: [
              SizedBox(height: 10,),

            ]
          ),
        ),
      ),
    );
  }
}