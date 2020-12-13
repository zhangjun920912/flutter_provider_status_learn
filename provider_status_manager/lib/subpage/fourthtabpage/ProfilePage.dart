import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  String name = '';

  ProfilePage(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('个人信息'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share), onPressed: sharePlatform)
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Image.network('https://www.suanya.cn/dist/img/home-banner.a85336b.png', fit: BoxFit.fill),
          new RaisedButton(
              child: new Text(this.name),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  ///third platform share

  void sharePlatform() {
  }
}
