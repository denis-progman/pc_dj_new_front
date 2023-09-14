import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/styles/styles.dart';


class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper(this.widget,{Key? key, }) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.secondBrand,
          ],
        ),
      ),
      child: widget,
    );
  }
}
