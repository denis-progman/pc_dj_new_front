import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/event_providers/player_events.dart';
// import 'package:get/get.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/styles/app_colors.dart';
import 'package:provider/provider.dart';

class TrackListItem extends StatelessWidget {
  const TrackListItem({
    Key? key,
    required this.track,
  }) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TrackPlayerEvents>().setTrack(track);
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    track.description,
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Row(children: [
                                    Text("${track.rating}%"),
                                    const Text("YES"),
                                  ])
                                ]),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              LinearProgressIndicator(
                value: track.rating / 100,
                semanticsLabel: 'Linear progress indicator',
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("${track.no}:NO", textScaleFactor: 0.8, style: TextStyle(background: Paint()..color = AppColors.transparentBlack,)), 
                  Text("YES:${track.yes}", textScaleFactor: 0.8, style: TextStyle(background: Paint()..color = AppColors.transparentBlack,))
                ],
              ),
              ButtonBar(
                // mainAxisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () => {},
                      child: Text("LIKE 100", textScaleFactor: 0.6)),
                  TextButton(
                      onPressed: () => {},
                      child: Text("COMMENTS 100", textScaleFactor: 0.6)),
                  TextButton(
                    onPressed: () => {},
                    child: Text("TO FAVORITE", textScaleFactor: 0.6),
                  ),
                  TextButton(
                      onPressed: () => {},
                      child: Text("SHARE 100", textScaleFactor: 0.6)),
                ],
              )
            ],
          )),
    );
  }
}
