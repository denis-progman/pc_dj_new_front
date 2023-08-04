import 'package:pc_dj_new_front/models/track.dart';

class TrackStorage {
  static List<Track> galleryTrackList = [
    Track(
      title: 'Inspection',
      description: 'Leftfield',
      url: 'assets/audio/default/tracks/Leftfield - Inspection (Hackers 2).mp3',
      coverUrl: 'assets/images/default/covers/Leftfield_Inspection.jpg',
    ),
    Track(
      title: 'Sad but True',
      description: 'Orbital',
      url: 'assets/audio/default/tracks/Orbital - Sad but True.mp3',
      coverUrl: 'assets/images/default/covers/Orbital_Sad_but_True.jpg',
    ),
    Track(
      title: 'Cowgirl',
      description: 'Cowgirl',
      url: 'assets/audio/default/tracks/Underworld - Cowgirl.mp3',
      coverUrl: 'assets/images/default/covers/Underworld_Cowgirl.jpg',
    )
  ];
}
