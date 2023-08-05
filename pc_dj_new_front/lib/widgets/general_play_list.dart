import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/section_header.dart';
import 'package:pc_dj_new_front/widgets/components/track_list_item.dart';

class GeneralPlayList extends StatelessWidget {
  const GeneralPlayList({Key? key, required this.trackList, }) : super(key: key);
  final List<Track> trackList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trackList.length,
            itemBuilder: ((context, index) {
              return TrackListItem(track: trackList[index]);
            }),
          ),
        ],
      ),
    );
  }
}