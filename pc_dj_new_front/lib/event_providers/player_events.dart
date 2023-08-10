import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';
import 'package:pc_dj_new_front/widgets/components/track_player/player_surf_bar.dart';

class TrackPlayerEvents with ChangeNotifier {
  Track? _currentTrack;
  Track get track => _currentTrack ?? TrackStorage.galleryTrackList[0];

  void setTrack(Track track) {
    _currentTrack = track;
    print("set track: ${track.title}");
    notifyListeners();
  }

  Stream<PlayerSurfBarData>? _getTrackStream;
  Stream<PlayerSurfBarData>? get trackStream => _getTrackStream;

  void passTrackStream(Stream<PlayerSurfBarData> trackStream) {
    _getTrackStream = trackStream;
    print("got trackStream");
    notifyListeners();
  }
}
