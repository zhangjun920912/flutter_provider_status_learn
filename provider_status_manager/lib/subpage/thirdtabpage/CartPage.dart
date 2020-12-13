import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CartPage extends StatelessWidget {
  const CartPage();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new CheckoutPage(),
        theme: new ThemeData(
          primaryColor: Color(0xFF198CFF),
        ));
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckoutPageState();
  }
}

class CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    var images = [
      'http://n.sinaimg.cn/front/351/w640h511/20181028/IMAa-hnaivxp6318749.jpg',
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=203592236,407361841&fm=26&gp=0.jpg',
      'http://n.sinaimg.cn/sinacn21/328/w687h441/20180801/d853-hhehtqf0969489.png',
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=463298063,3917828360&fm=26&gp=0.jpg',
      'https://b-ssl.duitang.com/uploads/item/201808/09/20180809210617_kkjgc.thumb.700_0.jpg',
    ];
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Checkout Follow'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add_shopping_cart), onPressed: _pushSaved),
        ],
      ),
      body: new Swiper(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        pagination: new SwiperPagination(),
        control: null,
        loop: true,
        autoplay: true,
        duration: 300,
        itemWidth: 300.0,
        itemHeight: 240.0,
        layout: SwiperLayout.STACK,
      ),
      backgroundColor: Colors.black,
    );
  }

  void _pushSaved() {}
}
