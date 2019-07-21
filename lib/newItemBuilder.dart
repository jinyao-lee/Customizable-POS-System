import 'package:flutter/material.dart';

class NewItemBuilder extends StatefulWidget {
  @override
  State createState() {
    return _NewItemBuilder();
  }
}

class _NewItemBuilder extends State<NewItemBuilder> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Item'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    _key.currentState.validate();
                    print('all ok');
                  });
                }),
          ],
        ),
        body: ListView(
          key: Key('OrderedListView'),
          children: <Widget>[
            Form(
              key: _key,
              autovalidate: true,
              child: _formBuilder(),
            ),
            Container(
                child: RaisedButton(
              child: Text('Add customizable options'),
            )),
          ],
        ));
  }

  Widget _formBuilder() {
    return Column(
      children: <Widget>[
        _getNonCustomizableInputWidget('Name of item'),
        _getPriceInputWidget(),
      ],
    );
  }

  Widget _getPriceInputWidget() {
    return Row(
      children: <Widget>[
        Container(
          child: Text('Price: \$'),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Form(
                child: TextFormField(
                  autovalidate: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required.';
                    } else if (double.tryParse(value) == null) {
                      print('bad');
                      return 'Invalid input';
                    }
                    return null;
                  },
                ),
              ),
            )),
      ],
    );
  }

  /// Returns title block.
  Widget _getNonCustomizableInputWidget(String fieldName) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(fieldName),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Form(
                child: TextFormField(
                  autovalidate: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                ),
              ),
            ))
      ],
    );
  }
}
