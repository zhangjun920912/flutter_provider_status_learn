import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ProductDetailPage extends StatelessWidget {

  const ProductDetailPage();

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      '携程旅行网',
      style: new TextStyle(color: Colors.white),
    ));
    titleContent.add(new Container(
      width: 50.0,
    ));

    return new WebviewScaffold(
      url: "https://www.ctrip.com/?sid=155952&allianceid=4897&ouid=index",
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
