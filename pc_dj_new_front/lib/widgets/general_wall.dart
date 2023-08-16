import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/section_header.dart';
import 'package:pc_dj_new_front/widgets/components/track_list_item/track_list_item.dart';
import 'package:pc_dj_new_front/widgets/wall_post.dart';

class GeneralWall extends StatelessWidget {
  GeneralWall({
    Key? key,
    required this.trackList,
  }) : super(key: key);
  final List<Track> trackList;

  final ScrollController _controller = ScrollController();
  final double _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            itemCount: trackList.length,
            itemBuilder: ((context, index) {
              return WallPost(
                TrackPost(
                  track: trackList[index],
                  // index: index,
                ),
                scrollController: _controller,
              );
            }),
          ),
        ],
      ),
    );
  }
}
