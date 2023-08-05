import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/storage/tracks.dart';
// import 'package:pc_dj_new_front/widgets/components/player_bagckround_filter.dart';
import 'package:pc_dj_new_front/widgets/components/player_buttons.dart';
import 'package:pc_dj_new_front/widgets/components/player_surf_bar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class TrackPlayer extends StatefulWidget {
  const TrackPlayer({super.key});

  @override
  State<TrackPlayer> createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  Track track = TrackStorage.galleryTrackList[1];

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${track.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<PlayerSurfBarData> get _surfBarDataStream =>
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
    return Column(children: [
          // Image.asset(
          //   widget.track.coverUrl,
          //   fit: BoxFit.contain,
          // ),
          // const TrackPlayerBackgroundFilter(),
          TrackPlayerView(
            track: track,
            surfBarDataStream: _surfBarDataStream,
            audioPlayer: audioPlayer,
          ),
        ],
      );
  }
}

class TrackPlayerView extends StatelessWidget {
  const TrackPlayerView({
    Key? key,
    required this.track,
    required Stream<PlayerSurfBarData> surfBarDataStream,
    required this.audioPlayer,
  })  : _surfBarDataStream = surfBarDataStream,
        super(key: key);

  final Track track;
  final Stream<PlayerSurfBarData> _surfBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            track.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            track.description,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          StreamBuilder<PlayerSurfBarData>(
            stream: _surfBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return PlayerSurfBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChangeEnd: audioPlayer.seek,
              );
            },
          ),
          TrackPlayerButtons(audioPlayer: audioPlayer),
          // const TrackPlayerFooter(),
        ],
      ),
    );
  }
}
