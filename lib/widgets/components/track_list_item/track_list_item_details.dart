import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
import 'package:pc_dj_new_front/storage/comment_storage.dart';
import 'package:pc_dj_new_front/styles/app_colors.dart';
import 'package:pc_dj_new_front/widgets/components/social_buttons_bar.dart';
import 'package:pc_dj_new_front/widgets/post_comment_box.dart';

class TrackListItemDetails extends StatelessWidget {
  const TrackListItemDetails({
    super.key,
    required this.track,
    required this.showDetails,
  });

  final Track track;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LinearProgressIndicator(
        value: track.rating / 100,
        semanticsLabel: 'Linear progress indicator',
      ),
      Visibility(
          visible: showDetails,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${track.no}:NO",
                  textScaleFactor: 0.8,
                  style: TextStyle(
                    background: Paint()..color = AppColors.transparentBlack,
                  )),
              Text("YES:${track.yes}",
                  textScaleFactor: 0.8,
                  style: TextStyle(
                    background: Paint()..color = AppColors.transparentBlack,
                  ))
            ],
          )),
      const SocialButtonsBar(),
      Visibility(
          visible: showDetails,
          child: PostCommentBox(
            CommentStorage.commentsByTrackId(track.id),
          )),
      Visibility(
          visible: showDetails,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 16),
                  backgroundColor: AppColors.secondBrand.withOpacity(0.6),
                ),
                child: const Text("YES"),
              ),
              Icon(
                Icons.thumbs_up_down,
                color: Colors.white.withOpacity(0.5),
                size: 30,
              ),
              TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 16),
                  backgroundColor: AppColors.secondBrand.withOpacity(0.6),
                ),
                child: const Text("NO"),
              ),
            ],
          )),
    ]);
  }
}
