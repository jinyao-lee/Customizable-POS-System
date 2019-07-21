import 'package:flutter/material.dart';

class NewItemBuilder extends StatefulWidget {

  @override
  State createState() {
    return _NewItemBuilder();
  }
}

class _NewItemBuilder extends State<NewItemBuilder> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('hellooooooooooooooo');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Item')
        ),
      )
    );
//    return ListView(
//      children: <Widget>[
//        TextFormField(
//          validator: (value) {
//            if (value.isEmpty) {
//              return 'This field is required.';
//            }
//            return null;
//          },
//        )
//      ],
//    );
  }
}