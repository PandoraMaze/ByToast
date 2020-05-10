library bytoast;

import 'package:flutter/material.dart';

import 'core/toast_data.dart';
import 'core/toast_mgr.dart';
import 'core/toast_style.dart';

class ByToast {
  ByToast._();

  /// Show Normal Toast
  static void short(BuildContext context, String msg) =>
      more(context, msg: msg);

  /// Show Long Shown Toast
  static void long(BuildContext context, String msg) => more(
        context,
        msg: msg,
        duration: ToastStyle.longDuration,
      );

  /// Show Toast with Icon on Left/Top
  static void withIcon(BuildContext context, String msg, Widget icon,
          {isOnTop = false}) =>
      more(
        context,
        msg: msg,
        iconPathLeft: isOnTop ? null : icon,
        iconPathTop: isOnTop ? icon : null,
        gravity: isOnTop ? ToastStyle.center : null,
      );

  /// Show Toast
  static void more(
    BuildContext context, {
    String msg,
    Alignment gravity,
    Duration duration,
    Color bgColor,
    Color txtColor,
    double txtSize,
    Widget iconPathTop,
    Widget iconPathLeft,
  }) =>
      ToastMgr.instance.showToast(context,
          data: ToastData(
            msg: msg,
            gravity: gravity,
            duration: duration,
            bgColor: bgColor,
            txtColor: txtColor,
            txtSize: txtSize,
            iconPathTop: iconPathTop,
            iconPathLeft: iconPathLeft,
          ));
}
