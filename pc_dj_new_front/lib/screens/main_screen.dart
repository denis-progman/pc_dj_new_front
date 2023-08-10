import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/general_play_list.dart';
import 'package:pc_dj_new_front/widgets/header.dart';
import 'package:pc_dj_new_front/widgets/search_input.dart';
import 'package:pc_dj_new_front/widgets/track_gallery.dart';
import 'package:pc_dj_new_front/styles/styles.dart';
import 'package:pc_dj_new_front/bars/bars.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key,}) : super(key: key);
  
  final trackPlayer = const TrackPlayer();
  @override
  Widget build(BuildContext context) {
    List<Track> trackList = TrackStorage.galleryTrackList;
    // final trackStream = context.watch<TrackPlayerEvents>().trackStream;

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
        appBar: const TopAppBar(),
        bottomNavigationBar: NavBar(ofTopWidget: trackPlayer),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              // StreamBuilder<PlayerSurfBarData>(
              //   stream: trackStream,
              //   builder: (context, snapshot) {
              //     final positionData = snapshot.data;
              //     return Column(children: [
              //         Text(positionData?.position.toString() ?? " - "),
              //         Text(positionData?.duration.toString() ?? " - "),
              //       ]
              //     );
              //   },
              // ),
              const SearchInput(),
              TrackGallery(trackList: trackList),
              GeneralPlayList(trackList: trackList),
            ],
          ),
        ),
      ),
    );
  }
}
