import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/styles/styles.dart';

class LightIconButton extends StatelessWidget {
  const LightIconButton({
    super.key,
    required this.label,
    required this.icon,
    required this.size,
    required this.onPressed,
  });

  final String label;
  final Function onPressed;
  final IconData icon;
  final double size;

  double get textScaleFactor => size / 30;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onPressed(),
      // style: TextButton.styleFrom(
      //   // mouseCursor:
      //   // backgroundColor: AppColors.transparentBlack.withOpacity(0.1),
        
      // ),
      label: Text(label, textScaleFactor: textScaleFactor),
      icon: Icon(icon, size: size, color: AppColors.secondBrand,),
    );
  }
}
