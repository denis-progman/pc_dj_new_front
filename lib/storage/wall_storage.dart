import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/services/track_service.dart';

class WallStorage {

  List<Track> get trackList => TrackService.getTracksBy(
    fieldName: "visibility", 
    fieldValue: "all",
  );

  static List<Track> galleryTrackList = [
    Track(
      id: 0,
      title: 'Inspection',
      description: 'Leftfield',
      url: 'assets/audio/default/tracks/Leftfield_-_Inspection__Hackers_2.mp3',
      coverUrl: 'assets/images/default/covers/Leftfield_Inspection.jpg',
      yes: 1234,
      no: 234,
      plays: 12000,
    ),
    Track(
      id: 1,
      title: 'Sad but True',
      description: 'Orbital',
      url: 'assets/audio/default/tracks/Orbital_-_Sad_but_True.mp3',
      coverUrl: 'assets/images/default/covers/Orbital_Sad_but_True.jpg',
      yes: 124,
      no: 24,
      plays: 964,
    ),
    Track(
      id: 2,
      title: 'Cowgirl',
      description: 'Cowgirl',
      url: 'assets/audio/default/tracks/Underworld_-_Cowgirl.mp3',
      coverUrl: 'assets/images/default/covers/Underworld_Cowgirl.jpg',
      yes: 55,
      no: 20,
      plays: 1264,
    )
  ];
}