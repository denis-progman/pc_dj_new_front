import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/widgets/components/player_surf_bar_stage.dart';

class PlayerSurfBarData {
  final Duration position;
  final Duration duration;

  PlayerSurfBarData(this.position, this.duration);
}

class PlayerSurfBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const PlayerSurfBar({
    Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  State<PlayerSurfBar> createState() => PlayerSeekBarState();
}
