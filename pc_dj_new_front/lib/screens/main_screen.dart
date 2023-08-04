import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/header.dart';
import 'package:pc_dj_new_front/widgets/search_input.dart';
import 'package:pc_dj_new_front/widgets/track_gallery.dart';
import 'package:pc_dj_new_front/styles/styles.dart';
import 'package:pc_dj_new_front/bars/bars.dart';
import 'package:pc_dj_new_front/storage/tracks.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Track> tracks = TrackStorage.galleryTrackList;
    // List<Playlist> playlists = Playlist.playlists;

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
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              const SearchInput(),
              TrackGallery(songs: tracks),
              // _PlaylistMusic(playlists: playlists),
            ],
          ),
        ),
      ),
    );
  }
}
