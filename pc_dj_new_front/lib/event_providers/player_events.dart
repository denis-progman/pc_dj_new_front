import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/storage/track_storage.dart';

class TrackPlayerEvents with ChangeNotifier {
  Track? _currentTrack;
  Track get track => _currentTrack ?? TrackStorage.galleryTrackList[0];

  void setTrack(Track track) {
    _currentTrack = track;
    print("set track: ${track.title}");
    notifyListeners();
  }
}
