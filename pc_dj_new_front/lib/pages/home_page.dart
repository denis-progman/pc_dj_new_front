import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/bars/nav_bar.dart';
import 'package:pc_dj_new_front/bars/top_app_bar.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/pages/screen_wrapper.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/general_wall.dart';
import 'package:pc_dj_new_front/widgets/tack_wave.dart';
import 'package:pc_dj_new_front/widgets/track_gallery.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';

class HomePage extends StatelessWidget {
  HomePage(
      {super.key,
      required this.audioPlayer,
      required this.trackPlayer,
      required this.surfBarDataStream});
  final AudioPlayer audioPlayer;
  final TrackPlayer trackPlayer;
  final Stream<PlayerSurfBarData> surfBarDataStream;

  final List<Track> trackList = TrackStorage.galleryTrackList;

  @override
  Widget build(BuildContext context) {
    List<Track> trackList = TrackStorage.galleryTrackList;
    final trackWaveBar = TrackWaveState(
      surfBarDataStream: surfBarDataStream,
      audioPlayer: audioPlayer,
    );
    return ScreenWrapper(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopAppBar(flexibleSpaceBar: trackWaveBar),
        bottomNavigationBar: NavBar(ofTopWidget: trackPlayer),
        body: SingleChildScrollView(
          physics: null,
          child: Column(
            children: [
              // const SearchInput(),
              TrackGallery(trackList: trackList),
              GeneralWall(postList: trackList),
            ],
          ),
        ),
      ),
    );
  }
}
