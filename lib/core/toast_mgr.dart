import 'package:bytoast/core/toast_data.dart';
import 'package:bytoast/core/toast_layer.dart';
import 'package:bytoast/core/toast_style.dart';
import 'package:flutter/material.dart';

class ToastMgr {
  ToastMgr._();

  factory ToastMgr() => _getInstance();

  static ToastMgr get instance => _getInstance();
  static ToastMgr _instance;

  GlobalKey<ToastLayerState> _key;
  OverlayEntry _entry;
  DateTime _newTime;
  bool _isShow = false;

  static ToastMgr _getInstance() {
    _instance ??= ToastMgr._();
    return _instance;
  }

  /// Create View
  showToast(
    BuildContext context, {
    ToastData data,
  }) async {
    assert(data != null);
    assert(data.msg != null);
    assert(data.gravity != null);
    assert(data.duration != null);
    assert(data.bgColor != null);
    assert(data.txtColor != null);
    assert(data.txtSize != null);

    _newTime = DateTime.now();

    Duration showDuration;
    if (_entry == null) {
      _key = GlobalKey();
      _entry = _createOverlay(data.gravity, data);

      // Init Layout
      Overlay.of(context).insert(_entry);

      // Delay Run Fade in Anim to Wait UI Initialed
      showDuration = data.exactDuration;
      await Future.delayed(const Duration(milliseconds: ToastStyle.threshold));
    } else {
      showDuration = data.fadePoint;
      _key.currentState.refresh(holder: data);
    }

    _isShow = true;
    _entry.markNeedsBuild();

    await Future.delayed(showDuration);

    if (_checkTime(data.fadePoint)) {
      _isShow = false;
      _entry.markNeedsBuild();

      await Future.delayed(ToastStyle.fadeOutTime);
      if (_checkTime(data.gonePoint)) {
        _entry.remove();
        _entry = null;
      }
    }
  }

  _createOverlay(gravity, newHolder) => OverlayEntry(
        builder: (context) => IgnorePointer(
          child: Container(
            alignment: gravity,
            child: AnimatedOpacity(
              opacity: _isShow ? ToastStyle.alpha : 0.0,
              duration:
                  _isShow ? ToastStyle.fadeInTime : ToastStyle.fadeOutTime,
              child: ToastLayer(
                key: _key,
                holder: newHolder,
              ),
            ),
          ),
        ),
      );

  bool _checkTime(Duration target) =>
      DateTime.now().difference(_newTime).compareTo(target) > 0;
}
