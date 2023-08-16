import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  WallPost(
    this.content, {
    super.key,
    required this.scrollController,
  });

  final Widget content;
  final ScrollController scrollController;
  bool showDetails = false;

  void _animateToIndex(int index) {
    // _controller.animateTo(
    //   index * _height,
    //   duration: Duration(seconds: 2),
    //   curve: Curves.fastOutSlowIn,
    // );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.deepPurple.shade800.withOpacity(0.6);

    if (showDetails) {
      showDetails = true;
      color = color.withRed(120);
    }
    return InkWell(
        onTap: () {
          showDetails = !showDetails;
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: content,
        ));
  }
}
