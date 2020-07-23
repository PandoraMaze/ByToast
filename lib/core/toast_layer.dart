import 'package:bytoast/core/toast_data.dart';
import 'package:bytoast/core/toast_style.dart';
import 'package:flutter/material.dart';

class ToastLayer extends StatefulWidget {
  ToastLayer({Key key, this.holder})
      : assert(holder != null),
        assert(holder.msg != null),
        super(key: key);

  final ToastData holder;

  @override
  State<StatefulWidget> createState() => ToastLayerState();
}

class ToastLayerState extends State<ToastLayer>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  ToastData _holder;

  @override
  void initState() {
    super.initState();
    _holder = widget.holder ?? ToastData();
  }

  /// Set Visible
  void switchVisible(bool visible) => setState(() {});

  /// Update the UI
  void refresh({
    ToastData holder,
  }) {
    assert(holder != null);
    _holder.msg = holder.msg;
    _holder.iconPathTop = holder.iconPathTop;
    _holder.iconPathLeft = holder.iconPathLeft;

    _holder.duration = holder.duration ?? _holder.duration;
    _holder.gravity = holder.gravity ?? _holder.gravity;
    _holder.bgColor = holder.bgColor ?? _holder.bgColor;
    _holder.txtColor = holder.txtColor ?? _holder.txtColor;
    _holder.txtSize = holder.txtSize ?? _holder.txtSize;
  }

  Widget _buildContent() {
    // Add Left Icon
    List<Widget> rowWidgets = <Widget>[];
    if (_holder.iconPathLeft != null) {
      rowWidgets
        ..add(_holder.iconPathLeft)
        ..add(
          SizedBox(width: 8.0),
        );
    }
    rowWidgets.add(Flexible(
      child: Text(_holder.msg,
          style: TextStyle(
            fontSize: _holder.txtSize,
            color: _holder.txtColor,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          )),
    ));

    // Add Top Icon
    List<Widget> columnWidgets = <Widget>[];
    if (_holder.iconPathTop != null) {
      columnWidgets
        ..add(_holder.iconPathTop)
        ..add(
          SizedBox(height: 12.0),
        );
    }
    columnWidgets.add(Row(
      mainAxisSize: MainAxisSize.min,
      children: rowWidgets,
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: columnWidgets,
    );
  }

  Widget _buildView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ToastStyle.marginHorizontal),
      padding: _holder.iconPathTop == null
          ? ToastStyle.textPadding
          : ToastStyle.textWithIconPadding,
      decoration: BoxDecoration(
        color: _holder.bgColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 1.0),
              blurRadius: 2,
              spreadRadius: 1)
        ],
        borderRadius: new BorderRadius.all(Radius.circular(2)),
      ),
      child: _buildContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        alignment: _holder.gravity,
        child: _buildView(),
      ),
    );
  }
}
