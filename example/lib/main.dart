import 'package:bytoast/bytoast.dart';
import 'package:bytoast/core/toast_style.dart';
import 'package:flutter/material.dart';

import 'base/page_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandora Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends BasePageWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BasePageState<MyHomePage> {
  var _funcMap;
  var _gValue = ToastStyle.bottom;

  onItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        toast(context, 'This is a Toast');
        break;
      case 1:
        toast(context,
            'This is a Long Long Long Long Long Long Long Long Long Long Long Long Long Toast');
        break;
      case 2:
        ByToast.withIcon(
          context,
          'Succeed Tips',
          Image.asset('images/ic_tips_ok.webp', alignment: Alignment.center),
          isOnTop: true,
        );
        break;
      case 3:
        ByToast.withIcon(
            context, 'U Got a new Msg', Icon(Icons.alarm, color: Colors.white));
        break;
      case 4:
        ByToast.more(
          context,
          msg: 'Customization Shown',
          gravity: _gValue,
          txtColor: Colors.lightGreen,
        );
        break;
    }
  }

  @override
  void initParams() {
    super.initParams();
    _funcMap = [
      'Toast：Normal',
      'Toast：Normal Wrap',
      'Toast：Succeed Tips',
      'Toast：With Img',
      'Toast：Customization',
    ];
  }

  @override
  String getTitle() {
    return "Toaster Demo";
  }

  _switchGravity(value) {
    setState(() {
      _gValue = value;
    });
  }

  @override
  buildBody() => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _funcMap.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(_funcMap[index]),
                  onTap: () {
                    onItemClick(context, index);
                  },
                ),
              );
            },
          )),
          SizedBox(height: 8.0),
          RadioListTile(
            value: ToastStyle.top,
            title: Text('Top'),
            groupValue: _gValue,
            onChanged: _switchGravity,
          ),
          RadioListTile(
            value: ToastStyle.center,
            title: Text('Center'),
            groupValue: _gValue,
            onChanged: _switchGravity,
          ),
          RadioListTile(
            value: ToastStyle.bottom,
            title: Text('Bottom'),
            groupValue: _gValue,
            onChanged: _switchGravity,
          )
        ],
      );
}
