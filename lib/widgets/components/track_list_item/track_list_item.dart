import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/widgets/components/track_list_item/track_list_item_details.dart';
import 'package:pc_dj_new_front/widgets/wall_post.dart';
import 'package:provider/provider.dart';

class TrackPost extends StatelessWidget {
  const TrackPost({
    Key? key,
    required this.track,
    required this.scrollController,
  }) : super(key: key);

  final Track track;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    bool showDetails = false;
    Track playingTrack = context.watch<TrackPlayerEvents>().track;
    Icon playIcon = const Icon(
      Icons.play_circle,
      color: Colors.white,
      size: 25,
    );
    if (playingTrack == track) {
      playIcon = const Icon(
        Icons.pause_circle_filled,
        color: Colors.white,
        size: 25,
      );
      showDetails = true;
    }
    return WallPost(
      Column(
        children: [
          Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image.asset(
                      track.coverUrl,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                track.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(children: [
                                const Icon(
                                  size: 16,
                                  Icons.headphones,
                                  color: Colors.white,
                                ),
                                Text("${track.plays}"),
                              ]),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                track.description,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Row(children: [
                                Text("${track.rating}%"),
                                const Text("YES"),
                              ])
                            ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                    child: IconButton(
                      onPressed: () => {
                        if (playingTrack != track)
                          {context.read<TrackPlayerEvents>().setTrack(track)}
                      },
                      icon: playIcon,
                    ),
                  ),
                ],
              )),
          TrackListItemDetails(
            track: track,
            showDetails: showDetails,
          ),
        ],
      ),
      scrollController: scrollController,
    );
  }
}
