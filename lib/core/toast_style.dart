import 'package:flutter/material.dart';

class ToastStyle {
  // Gravity
  static const Alignment center = Alignment.center;
  static const Alignment top = Alignment(0.0, -0.5);
  static const Alignment bottom = Alignment(0.0, 0.5);

  static const EdgeInsetsGeometry textPadding =
      EdgeInsets.only(left: 32, right: 32, top: 10, bottom: 10);
  static const EdgeInsetsGeometry textWithIconPadding =
      EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 14);

  // Duration
  static const Duration shortDuration = Duration(milliseconds: 2400);
  static const Duration longDuration = Duration(milliseconds: 5200);

  // Anim
  static const Duration fadeOutTime = Duration(milliseconds: 350);
  static const Duration fadeInTime = Duration(milliseconds: 200);
  static const int threshold = 32;

  // Theme
  static const Color bgColor = Colors.black;
  static const Color txtColor = Colors.white;
  static const double txtSize = 14;

  static const double marginHorizontal = 32;
  static const double alpha = 0.8;
}
