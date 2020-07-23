import 'package:flutter/material.dart';

class ToastStyle {
  /// Gravity-Center
  static const Alignment center = Alignment.center;

  /// Gravity-Top
  static const Alignment top = Alignment(0.0, -0.5);

  /// Gravity-Bottom
  static const Alignment bottom = Alignment(0.0, 0.5);

  /// Padding for Normal Style
  static const EdgeInsetsGeometry textPadding =
      EdgeInsets.only(left: 32, right: 32, top: 10, bottom: 10);

  /// Padding for Icon Style
  static const EdgeInsetsGeometry textWithIconPadding =
      EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16);

  /// Shown Short Time
  static const Duration shortDuration = Duration(milliseconds: 2400);

  /// Shown Long Time
  static const Duration longDuration = Duration(milliseconds: 5200);

  /// Anim-Fade out
  static const Duration fadeOutTime = Duration(milliseconds: 350);

  /// Anim-Fade In
  static const Duration fadeInTime = Duration(milliseconds: 200);

  /// Delay Run Fade in Anim to Wait UI Initialed
  static const int threshold = 32;

  /// Background Color
  static const Color bgColor = Colors.black;

  /// Text Color
  static const Color txtColor = Colors.white;

  /// Text Size
  static const double txtSize = 14;

  /// Content Min Margin
  static const double marginHorizontal = 32;

  /// Background Alpha
  static const double alpha = 0.8;
}
