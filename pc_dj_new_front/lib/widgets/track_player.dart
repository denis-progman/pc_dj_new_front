import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_view.dart';
import 'package:pc_dj_new_front/widgets/tack_wave.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class TrackPlayer extends StatefulWidget {
  const TrackPlayer({super.key});

  @override
  State<TrackPlayer> createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  Track track = TrackStorage.galleryTrackList[0];

  void _loadTrack({bool autoPlay = true}) {
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${track.url}'),
          ),
        ],
      ),
    );
    if (autoPlay) {
      audioPlayer.play();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTrack();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

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
      });

  @override
  Widget build(BuildContext context) {
    track = context.watch<TrackPlayerEvents>().track;
    _loadTrack(autoPlay: true);
    return Column(
      children: [
        // Image.asset(
        //   widget.track.coverUrl,
        //   fit: BoxFit.contain,
        // ),
        // const TrackPlayerBackgroundFilter(),
        TrackPlayerView(
          track: track,
          surfBarDataStream: surfBarDataStream,
          audioPlayer: audioPlayer,
        ),
        TrackWaveState(
          surfBarDataStream: surfBarDataStream,
          audioPlayer: audioPlayer,
        ),
      ],
    );
  }
}
