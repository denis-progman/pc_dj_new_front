import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/bars/nav_bar.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/pages/screen_wrapper.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/styles/app_colors.dart';
import 'package:pc_dj_new_front/widgets/components/titled_avatar.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/track_player.dart';

class UserCabinetPage extends StatelessWidget {
  UserCabinetPage({
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
              Text("PRIVATE CABINET", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: NavBar(ofTopWidget: trackPlayer),
        body: SingleChildScrollView(
          physics: null,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TitledAvatar(
                    imageUrl: 'assets/images/default/dj_avatar.png',
                    imageTitle: "DJ Best Style",
                    size: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Alex Yong"),
                    Text("https://external_link.com"),
                    Text("continent: Asia"),
                  ]),
                ],
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 16),
                  backgroundColor: AppColors.secondBrand.withOpacity(0.6),
                ),
                child: const Text("ADD TRACK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}