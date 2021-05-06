import 'dart:math' as math;

import 'package:autolist/autolist.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Autolist Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _items = [];

  void _addManyItem() {
    setState(() {
      final newIdx = math.Random().nextInt(_items.length + 1);
      final length = math.Random().nextInt(10) + 2;
      final newValues =
          List.generate(length, (index) => math.Random().nextInt(10000));
      _items.insertAll(newIdx, newValues);
    });
  }

  void _addItem() {
    setState(() {
      final newIdx = math.Random().nextInt(_items.length + 1);
      final newValue = math.Random().nextInt(10000);
      _items.insert(newIdx, newValue);
    });
  }

  void _removeItem() {
    setState(() {
      if (_items.length == 0) {
        return;
      }

      final idx = math.Random().nextInt(_items.length);
      _items.removeAt(idx);
    });
  }

  void _removeManyItem() {
    setState(() {
      if (_items.length == 0) {
        return;
      }

      final startIdx = math.Random().nextInt(_items.length - 1);
      final endIdx = math.Random().nextInt(_items.length - startIdx) + startIdx;
      _items.removeRange(startIdx, endIdx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: AutoList<int>(
        items: _items,
        duration: Duration(milliseconds: 400),
        itemBuilder: (context, item) {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Text(
                    item.toString(),
                    key: Key(item.toString()),
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[900]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _removeItem,
            tooltip: 'Remove item',
            child: Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FloatingActionButton(
              onPressed: _addItem,
              tooltip: 'Add item',
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FloatingActionButton(
              onPressed: _removeManyItem,
              tooltip: 'Add many item',
              child: Stack(
                children: [
                  Icon(Icons.remove),
                  Transform.translate(
                      offset: Offset(2, 2), child: Icon(Icons.remove)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FloatingActionButton(
              onPressed: _addManyItem,
              tooltip: 'Add many item',
              child: Stack(
                children: [
                  Icon(Icons.add),
                  Transform.translate(
                      offset: Offset(2, 2), child: Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
