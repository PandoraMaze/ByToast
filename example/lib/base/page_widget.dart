import 'package:bytoast/bytoast.dart';
import 'package:flutter/material.dart';

abstract class BasePageWidget extends StatefulWidget {
  const BasePageWidget({Key key}) : super(key: key);
}

class BasePageState<T extends BasePageWidget> extends State<T>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  static const int singleView = 1;

  var _appInForeground;

  bool inForeground() => _appInForeground;

  /// 创建布局前的参数初始化
  @protected
  void initParams() {}

  /// 关闭页面前触发（后退键）
  @protected
  Future<bool> onBack() => Future.value(true);

  /// 底层布局点击事件
  @protected
  void onContentClick() {
    if (autoCloseKeyboard()) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  @protected
  String getTitle() => "";

  @protected
  Color getBackgroundColor() => Theme.of(context).scaffoldBackgroundColor;

  @protected
  int getTabViewCount() => singleView;

  @protected
  bool hasTopBar() => true;

  @protected
  bool autoCloseKeyboard() => true;

  @protected
  buildBody() => Container();

  @protected
  AppBar buildTopBar() {
    return hasTopBar()
        ? AppBar(
            title: Text(
              getTitle(),
              style: TextStyle(color: Colors.white),
            ),
            elevation: 10,
            centerTitle: true,
          )
        : null;
  }

  @protected
  BottomNavigationBar buildBottomBar() => null;

  @protected
  FloatingActionButton buildFloatingBtn() => null;

  @protected
  Widget buildLayout() => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onContentClick();
        },
        child: Scaffold(
          backgroundColor: getBackgroundColor(),
          appBar: buildTopBar(),
          body: buildBody(),
          bottomNavigationBar: buildBottomBar(),
          floatingActionButton: buildFloatingBtn(),
        ),
      );

  @protected
  toast(BuildContext context, String msg, [SnackBar snackBar]) {
    if (snackBar != null) {
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      ByToast.short(context, msg);
    }
  }

  /// 关闭当前页，result = false 时不调用 onWillPop()
  finish([result = true]) {
    Navigator.pop(context, result);
  }

  //=================== 页面跳转 Start ========================//

  @protected
  changePage(MaterialPageRoute route) {
    Navigator.pushReplacement(context, route);
  }

  @protected
  changePageRoute(Route route) {
    Navigator.pushReplacement(context, route);
  }

  @protected
  changePageName(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @protected
  goPage(MaterialPageRoute route) {
    Navigator.push(context, route);
  }

  @protected
  goPageRoute(Route route) {
    Navigator.push(context, route);
  }

  @protected
  goPageName(String routeName, [Object arguments]) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  //=================== 页面跳转 End ========================//

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Init Data
    initParams();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///  resumed:应用可见并可响应用户操作
  ///  inactive:用户可见，但不可响应用户操作
  ///  paused:已经暂停了，用户不可见、不可操作
  ///  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _appInForeground = true;
    } else if (state == AppLifecycleState.inactive) {
      _appInForeground = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Build Layout
    int tabViewCount = getTabViewCount();
    Widget content = tabViewCount > singleView
        ? DefaultTabController(length: tabViewCount, child: buildLayout())
        : buildLayout();
    return WillPopScope(
      onWillPop: onBack,
      child: content,
    );
  }

  @override
  bool get wantKeepAlive => false;
}
