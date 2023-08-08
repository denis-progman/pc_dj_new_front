import 'package:flutter/material.dart';

class TrackWaveStyle {
  TrackWaveStyle({
    required this.height,
    required this.width,
    this.activeColor = Colors.red,
    this.inactiveColor = Colors.blue,
    this.activeGradient,
    this.inactiveGradient,
    this.style = PaintingStyle.stroke,
    this.showActiveWaveform = true,
    this.absolute = false,
    this.invert = false,
    this.borderWidth = 1.0,
    this.activeBorderColor = Colors.white,
    this.inactiveBorderColor = Colors.white,
    this.isRoundedRectangle = false,
    this.isCentered = false,
  });

  double height;
  double width;
  Color inactiveColor;
  Gradient? inactiveGradient;
  bool invert;
  bool absolute;
  Color activeColor;
  Gradient? activeGradient;
  bool showActiveWaveform;
  PaintingStyle style;
  double borderWidth;
  Color activeBorderColor;
  Color inactiveBorderColor;
  bool isRoundedRectangle;
  bool isCentered;
}