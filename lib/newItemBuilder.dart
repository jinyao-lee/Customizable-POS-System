import 'package:flutter/material.dart';

class NewItemBuilder extends StatefulWidget {
  @override
  State createState() {
    return _NewItemBuilderState();
  }
}

class _NewItemBuilderState extends State<NewItemBuilder> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _handleSubmit() {
//final FormState form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      print('good. Now, save the form and do all the things required.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Item'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  _handleSubmit();
                }),
          ],
        ),
        body: ListView(
          key: Key('OrderedListView'),
          children: <Widget>[
            Form(
              key: _formKey,
              child: _getFormUi(),
            ),
            Container(
                child: RaisedButton(
                  child: Text('Add customizable options'),
                )
            ),
          ],
        )
    );
  }

  Widget _getFormUi() {
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is required.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Invalid input';
                  }
                  return null;
                },
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
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
            ))
      ],
    );
  }
}
