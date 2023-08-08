import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:pc_dj_new_front/styles/track_wave_style.dart';
import '../components/wave_json_data_loader.dart';

class CurvedWavePolygonData {
  final Duration position;
  final Duration duration;

  CurvedWavePolygonData(this.position, this.duration);
}

enum WaveformType {
  polygon,
  rectangle,
  squiggly,
  curvedPolygon,
}

class CurvedWavePolygonBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const CurvedWavePolygonBar({
    Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  State<CurvedWavePolygonBar> createState() => CurvedWavePolygonBarState();
}

class CurvedWavePolygonBarState extends State<CurvedWavePolygonBar> {
  late List<double> samples = [];

  // Values between 256 and 1024 are good for showing [RectangleWaveform] and [SquigglyWaveform]
  // While the values above them are good for showing [PolygonWaveform]
  int totalSamples = 2000;
  WaveformType waveformType = WaveformType.polygon;
  late TrackWaveStyle trackWaveStyle;

  Future<void> parseData() async {
    final json =
        await rootBundle.loadString("assets/audio/default/tracks/dm.json");
        samples = loadparseJson(json, totalSamples);
  }
  

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    parseData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    trackWaveStyle = TrackWaveStyle(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(      
      children: [
        Text(widget.duration.toString()),
        Text((widget.duration - widget.position).toString()),
        if (widget.duration.inMilliseconds.toInt() > 0) 
        CurvedPolygonWaveform(
          maxDuration: widget.duration,
          elapsedDuration: widget.position,
          samples: samples,
          height: trackWaveStyle.height,
          width: trackWaveStyle.width,
          inactiveColor: trackWaveStyle.inactiveColor,
          invert: trackWaveStyle.invert,
          absolute: trackWaveStyle.absolute,
          activeColor: trackWaveStyle.activeColor,
          showActiveWaveform: trackWaveStyle.showActiveWaveform,
          strokeWidth: trackWaveStyle.borderWidth,
          style: trackWaveStyle.style,
        ),
      ],
    );
  }
}
