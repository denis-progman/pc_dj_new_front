import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/general_wall.dart';
import 'package:pc_dj_new_front/widgets/header.dart';
import 'package:pc_dj_new_front/widgets/search_input.dart';
import 'package:pc_dj_new_front/widgets/tack_wave.dart';
import 'package:pc_dj_new_front/widgets/track_gallery.dart';
import 'package:pc_dj_new_front/styles/styles.dart';
import 'package:pc_dj_new_front/bars/bars.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
  }) : super(key: key);

  final AudioPlayer audioPlayer = AudioPlayer();

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
  Widget build(BuildContext context) {
    List<Track> trackList = TrackStorage.galleryTrackList;
    final trackPlayer = TrackPlayer(
      audioPlayer: audioPlayer,
      surfBarDataStream: surfBarDataStream,
    );
    final trackWaveBar = TrackWaveState(
      surfBarDataStream: surfBarDataStream,
      audioPlayer: audioPlayer,
    );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.secondBrand,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopAppBar(flexibleSpaceBar: trackWaveBar),
        bottomNavigationBar: NavBar(ofTopWidget: trackPlayer),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SearchInput(),
              TrackGallery(trackList: trackList),
              GeneralWall(trackList: trackList),
            ],
          ),
        ),
      ),
    );
  }
}
