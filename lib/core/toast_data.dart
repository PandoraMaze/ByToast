import 'package:flutter/material.dart';

import 'toast_style.dart';

class ToastData {
  String msg;
  Alignment gravity;
  Duration duration;
  Color bgColor;
  Color txtColor;
  double txtSize;
  Widget iconPathTop;
  Widget iconPathLeft;

  /// Shown Duration When Init
  Duration exactDuration;

  /// Fade Time Point
  Duration fadePoint;

  /// Gone Time Point
  Duration gonePoint;

  ToastData({
    String msg,
    Widget iconPathTop,
    Widget iconPathLeft,
    Alignment gravity,
    Duration duration,
    Color bgColor,
    Color txtColor,
    double txtSize,
  }) {
    this.msg = msg;
    this.iconPathTop = iconPathTop;
    this.iconPathLeft = iconPathLeft;

    this.gravity = gravity ?? ToastStyle.bottom;
    this.duration = duration ?? ToastStyle.shortDuration;
    this.bgColor = bgColor ?? ToastStyle.bgColor;
    this.txtColor = txtColor ?? ToastStyle.txtColor;
    this.txtSize = txtSize ?? ToastStyle.txtSize;

    this.exactDuration = Duration(
      milliseconds: this.duration.inMilliseconds - ToastStyle.threshold,
    );

    this.fadePoint = this.duration;
    this.gonePoint = Duration(
      milliseconds:
          this.duration.inMilliseconds + ToastStyle.fadeOutTime.inMilliseconds,
    );
  }
}
