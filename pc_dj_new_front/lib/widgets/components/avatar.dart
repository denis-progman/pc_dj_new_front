import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/styles/app_colors.dart';

class TitledAvatar extends StatelessWidget {
  const TitledAvatar({
    Key? key, 
    required this.imageUrl, 
    this.imageTitle = "", 
    this.size = 100, 
    this.titleGap = 5
    }): super(key: key);

  final String imageUrl;
  final String imageTitle;
  final double size;
  final double titleGap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        CircleAvatar(
          backgroundColor: AppColors.firstBrand,
          radius: size,
          backgroundImage: AssetImage(imageUrl),
        ),
        SizedBox(height: titleGap),
        Text(imageTitle),
      ]
    );
  }
}
