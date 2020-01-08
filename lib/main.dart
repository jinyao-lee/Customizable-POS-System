import 'package:customizable_pos_system/itemManager.dart';
import 'package:customizable_pos_system/model/item.dart';
import 'package:flutter/material.dart';
import 'newItemBuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('List of Items'),
          backgroundColor: Colors.orange[300],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _addNewItem();
                }
            )
          ],
        ),
        body: FutureBuilder<List<Item>>(
          future: ItemManager.getItemsList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data.map((item) => ListTile(
                title: Text(item.itemName),
              )).toList(),
            );
          },
        )
      ),
    );
  }

  void _addNewItem() async {
    final Item result = await Navigator.push(
        _scaffoldKey.currentContext,
        MaterialPageRoute(builder: (context) => NewItemBuilder()),
    );
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Added: ' + result.itemName)));
  }
}

class ItemDisplay extends StatefulWidget {

  @override
  State createState() => _ItemDisplayState();
}

class _ItemDisplayState extends State<ItemDisplay> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
