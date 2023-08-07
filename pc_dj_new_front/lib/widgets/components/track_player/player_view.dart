import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_buttons.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';

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
