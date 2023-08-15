import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/styles/styles.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_view.dart';
import 'package:pc_dj_new_front/widgets/tack_wave.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class TrackPlayer extends StatefulWidget {
  const TrackPlayer({
    Key? key,
    required this.audioPlayer,
    required surfBarDataStream,
  })  : _surfBarDataStream = surfBarDataStream,
        super(key: key);

  final AudioPlayer audioPlayer;
  final Stream<PlayerSurfBarData> _surfBarDataStream;

  @override
  State<TrackPlayer> createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  Track track = TrackStorage.galleryTrackList[0];

  void _loadTrack({bool autoPlay = true}) {
    widget.audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${track.url}'),
          ),
        ],
      ),
    );
    if (autoPlay) {
      widget.audioPlayer.play();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTrack();
  }

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    track = context.watch<TrackPlayerEvents>().track;
    _loadTrack(autoPlay: true);
    return 
            Container(
              color: Colors.transparent,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     stops: [
            //       0.2,
            //       0.6,
            //     ],
            //     colors: [
            //       Colors.transparent,
            //       AppColors.background,
            //     ],
            //   ),
            // ),
            child: 
    Column(
      children: [
        // Image.asset(
        //   widget.track.coverUrl,
        //   fit: BoxFit.contain,
        // ),
        // const TrackPlayerBackgroundFilter(),
        TrackPlayerView(
          track: track,
          surfBarDataStream: widget._surfBarDataStream,
          audioPlayer: widget.audioPlayer,
        ),
      ],
    ),
  );
  }
}
