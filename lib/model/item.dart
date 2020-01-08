import 'package:customizable_pos_system/model/addon.dart';

class Item {
  String itemName;
  double basePrice;
  List<AddOn> addOns;

  Item() {
    addOns = List();
  }

  Item.withPresetValues(String itemName, double basePrice) {
    this.itemName = itemName;
    this.basePrice = basePrice;
  }

  Map<String, dynamic> toMap() {
    return {
      'item_name' : itemName,
      'base_price' : basePrice
    };
  }
}