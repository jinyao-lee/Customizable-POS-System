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
//                  Navigator.push(
//                    _scaffoldKey.currentContext,
//                    MaterialPageRoute(builder: (context) => NewItemBuilder()),
//                  );
//                  _scaffoldKey.currentState.showSnackBar(
//                    SnackBar(
//                      content: Text('hello!'),
//                    ));
                }
            )
          ],
        ),
      ),
    );
  }

  void _addNewItem() async {
    final Item result = await Navigator.push(
        _scaffoldKey.currentContext,
        MaterialPageRoute(builder: (context) => NewItemBuilder()),
    );
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(result.itemName)));
  }
}

//class ViewItemsList extends StatefulWidget{
//
//  @override
//  State createState() {
//  }
//
//}
//
//class _ItemsListState extends State<ViewItemsList> {
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}
