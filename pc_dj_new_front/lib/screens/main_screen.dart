import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/general_play_list.dart';
import 'package:pc_dj_new_front/widgets/header.dart';
import 'package:pc_dj_new_front/widgets/search_input.dart';
import 'package:pc_dj_new_front/widgets/track_gallery.dart';
import 'package:pc_dj_new_front/styles/styles.dart';
import 'package:pc_dj_new_front/bars/bars.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final trackPlayer = const TrackPlayer();
  @override
  Widget build(BuildContext context) {
    List<Track> trackList = TrackStorage.galleryTrackList;

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
        bottomNavigationBar: NavBar(ofTopWidget: trackPlayer,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
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
