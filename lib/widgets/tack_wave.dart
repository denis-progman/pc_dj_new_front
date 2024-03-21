import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/styles/styles.dart';
import 'package:pc_dj_new_front/widgets/components/curved_wave_poligon.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';
import 'package:provider/provider.dart';

class TrackWaveState extends StatelessWidget {
  const TrackWaveState({
    Key? key,
    required Stream<PlayerSurfBarData> surfBarDataStream,
    required this.audioPlayer,
  })  : _surfBarDataStream = surfBarDataStream,
        super(key: key);

  final Stream<PlayerSurfBarData> _surfBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  @override
  Widget build(BuildContext context) {
    var _track = context.watch<TrackPlayerEvents>().track;

    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          // vertical: 5.0,
        ),
        child: Stack(alignment: AlignmentDirectional.center, children: [
          StreamBuilder<PlayerSurfBarData>(
            stream: _surfBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return CurvedWavePolygonBar(
                position:
                    positionData?.position ?? Duration(milliseconds: 1000),
                duration:
                    positionData?.duration ?? Duration(milliseconds: 1000),
                onChangeEnd: audioPlayer.seek,
              );
            },
          ),
          Positioned(
            child: Column(children: [
              Text(
                _track.title,
                style: TextStyle(
                    background: Paint()..color = AppColors.transparentBlack),
              ),
              Text(
                _track.description,
                style: TextStyle(
                    background: Paint()..color = AppColors.transparentBlack),
              ),
            ]),
          ),
        ])
        // const TrackPlayerFooter(),
        );
  }
}
