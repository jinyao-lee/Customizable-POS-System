import 'package:customizable_pos_system/utils/sqlUtil.dart';
import 'package:flutter/material.dart';
import 'model/item.dart';

var _numAddOns = 0;

class NewItemBuilder extends StatefulWidget {
  @override
  State createState() {
    return _NewItemBuilderState();
  }
}

class _NewItemBuilderState extends State<NewItemBuilder> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Item newItem = Item();

  void _handleSubmit(BuildContext context) {
    SqlUtil.testSql();
    if (_formKey.currentState.validate()) {
      Navigator.pop(context, newItem);
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
                  _handleSubmit(context);
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
          ],
        )
    );
  }

  Widget _getFormUi() {
    List<Widget> _widgetsToReturn = [
      _getNonCustomizableInputWidget('Name of item'),
      _getPriceInputWidget(),
    ];

    List<Widget> _addOns = List.generate(
        _numAddOns, (int i) => _ItemCustomizer());
    _widgetsToReturn.addAll(_addOns);

    return Column(
      children: _widgetsToReturn,
    );
  }

  /// Returns a new input widget that takes in a cost.
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
                    return 'Please enter a valid numeric value.';
                  }
                  return null;
                },
                onSaved: (val) => newItem.basePrice = double.parse(val)
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
                  onSaved: (val) => newItem.itemName = val,
              ),
            ))
      ],
    );
  }
}




/// Class for add on blocks.
class _ItemCustomizer extends StatefulWidget {
  final String title;
  _ItemCustomizer({Key key, this.title});

  @override
  State createState() => _ItemCustomizerState();
}

class _ItemCustomizerState extends State<_ItemCustomizer> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Text('Add-on'),
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
            )),
      ],
    );
  }
}
