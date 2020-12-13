import 'package:flutter/material.dart';

import 'subpage/firsttabpage/HomePage.dart';
import 'subpage/fourthtabpage/MePage.dart';
import 'subpage/secondtabpage/ShopPage.dart';
import 'subpage/thirdtabpage/CartPage.dart';

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      home: new MyStatefulWidget(),
      theme: new ThemeData(primaryColor: Color(0xFF198CFF)),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyStatefulWidgetState();
  }
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ShopPage(),
    CartPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: new AppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall), title: Text('Shop')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store), title: Text('Cart')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Me')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF198CFF),
        unselectedItemColor: Colors.grey[400],
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 4.0,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
