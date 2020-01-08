import 'package:customizable_pos_system/utils/sqlUtil.dart';

import 'model/item.dart';

class ItemManager {
  static Future<List<Item>> getItemsList() async {
    List<Item> itemsList;
    List<Map<String, dynamic>> maps = await SqlUtil.getItems();

    for (var item in maps) {
      itemsList.add(Item.withPresetValues(
          item['item_name'].toString(), double.parse(item['base_price'])));
    }

//    SqlUtil.getItems().then((item) {
//      print(item);
////      itemsList.add(Item.withPresetValues(
////          item['item_name'].toString(), double.parse(item['base_price'])));
//    });
    print('itemsList = ' + itemsList.toString());
    return itemsList;
  }
}
