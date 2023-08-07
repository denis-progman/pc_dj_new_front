import 'package:flutter/material.dart';

class TrackPlayerFooter extends StatelessWidget {
  const TrackPlayerFooter({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 35,
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        IconButton(
          iconSize: 35,
          onPressed: () {},
          icon: const Icon(
            Icons.cloud_download,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
