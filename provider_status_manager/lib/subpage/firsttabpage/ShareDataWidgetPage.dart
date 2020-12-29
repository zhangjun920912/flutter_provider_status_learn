import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ShareDateWidget.dart';

class ShareDataWidgetPage extends StatefulWidget {
  @override
  ShareDataWidgetPageStateful createState() =>
      new ShareDataWidgetPageStateful();
}

class ShareDataWidgetPageStateful extends State<ShareDataWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('IheritedWidget使用')),
      body: Center(
        child: ShareDataWidget(
          //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _TestWidget(), //子widget中依赖ShareDataWidget
                ),
              ),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => new _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Container(
      color: Colors.blue,
      child: Text("shina"),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
