import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/widgets/components/light_icon_button.dart';

class SocialButtonsBar extends StatelessWidget {
  const SocialButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: [
        LightIconButton(
          label: "50",
          icon: Icons.favorite,
          size: 30,
          onPressed: () => {},
        ),
        LightIconButton(
          label: "50",
          icon: Icons.comment,
          size: 30,
          onPressed: () => {},
        ),
        LightIconButton(
          label: "50",
          icon: Icons.bookmark,
          size: 30,
          onPressed: () => {},
        ),
        LightIconButton(
          label: "50",
          icon: Icons.ios_share,
          size: 30,
          onPressed: () => {},
        ),
      ],
    );
  }
}
