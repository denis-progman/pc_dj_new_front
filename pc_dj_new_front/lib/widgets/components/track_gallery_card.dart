import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/track.dart';
// import 'package:get/get.dart';

class TrackGalleryCard extends StatelessWidget {
  const TrackGalleryCard({Key? key, required this.track}) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Get.toNamed('/song', arguments: song);
      // },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(
                    track.coverUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        track.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        track.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
