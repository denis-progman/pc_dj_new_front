import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/section_header.dart';
import 'package:pc_dj_new_front/widgets/components/track_gallery_card.dart';

class TrackGallery extends StatelessWidget {
  const TrackGallery({Key? key, required this.songs}) : super(key: key);

  final List<Track> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return TrackGalleryCard(song: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
