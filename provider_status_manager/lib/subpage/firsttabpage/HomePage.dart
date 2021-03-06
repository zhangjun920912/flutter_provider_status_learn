import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'ProductDetailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomePageDisplayPage(),
        theme: new ThemeData(
          primaryColor: Color(0xFF198CFF),
        ));
  }
}

class HomePageDisplayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageDisplayPageState();
  }
}

class HomePageDisplayPageState extends State<HomePageDisplayPage> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  static const platform2 = const MethodChannel('samples.flutter.io/toast');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  String _networkRequestResult = 'Unknown result.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Products Display'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.center_focus_weak,
                  color: Colors.white,
                ),
                onPressed: _getToast),
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new RaisedButton(
                child: Text('Communication with native'),
                onPressed: _getBattery),
            new Text(
              'battery:$_batteryLevel',
              textAlign: TextAlign.center,
            ),
            new RaisedButton(child: Text('加载网页'), onPressed: _loadWebView),
          ],
        ));
  }

  Future<Null> _getToast() async {
    Map<String, String> map = {"flutter": "这是一个来自flutter调用Native端的Toast"};
    await platform2.invokeMethod('getNativeToast', map);
  }

  void _getBattery() {
    _getBatteryLevel();
  }

  void _loadWebView() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new ProductDetailPage()),
    );
  }
}
