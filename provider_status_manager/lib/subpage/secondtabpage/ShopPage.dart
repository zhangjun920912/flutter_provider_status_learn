import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ShopPage extends StatelessWidget {
  const ShopPage();

  @override
  Widget build(BuildContext context) {
    //Material是一种标准的移动端和web端的视觉设计语言,Flutter提供了一套丰富的Material widgets
    return new MaterialApp(
      title: 'Welcome to Iherbs',
      home: new RandomWorlds(),
      theme: new ThemeData(primaryColor: Color(0xFF198CFF)),
    );
  }
}

class RandomWorlds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWorldsState();
  }
}

class RandomWorldsState extends State<RandomWorlds> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    //它提供了默认的导航栏、标题和包含主屏幕widget树的body属性
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
            title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ));
      });
      final divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();

      return new Scaffold(
          appBar: new AppBar(title: new Text('Saved Suggestions')),
          body: new ListView(children: divided));
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
      },
    );
  }
}
