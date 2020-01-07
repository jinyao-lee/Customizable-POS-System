import 'dart:async';

import 'package:customizable_pos_system/model/item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlUtil {
  static const String _SQL_CREATE_TABLE_ITEM = "CREATE TABLE Items ("
      "item_name TEXT PRIMARY KEY,"
      "base_price NUMERIC NOT NULL);";
  static const String _SQL_CREATE_TABLE_ADDONS = "CREATE TABLE Addons ("
      "item_name TEXT REFERENCES Items,"
      "add_on_name TEXT NOT NULL,"
      "PRIMARY KEY(item_name, add_on_name));";
  static const String _SQL_CREATE_TABLE_ADDON_OPTIONS =
      "CREATE TABLE Options ("
      "item_name TEXT NOT NULL,"
      "add_on_name TEXT NOT NULL,"
      "option_name TEXT NOT NULL,"
      "price numeric NOT NULL,"
      "FOREIGN KEY (item_name, add_on_name) REFERENCES Addons,"
      "PRIMARY KEY(item_name, add_on_name, option_name));";

  static Future<Database> openSqlTableConnection() async {
    final Future<Database> database = openDatabase(
        join(await getDatabasesPath(), 'menu_item.db'),
        onOpen: (Database db) {
          db.execute("DROP TABLE IF EXISTS Items;");
          db.execute(_SQL_CREATE_TABLE_ITEM);
          db.execute("DROP TABLE IF EXISTS Addons;");
          db.execute(_SQL_CREATE_TABLE_ADDONS);
          db.execute("DROP TABLE IF EXISTS Options;");
          db.execute(_SQL_CREATE_TABLE_ADDON_OPTIONS);
        }, version: 1);
    return database;
  }

  /// To-remove. Just a testing function.
  static void testSql() async {
    Item itemToTest = Item();
    itemToTest.basePrice = 1.23;
    itemToTest.itemName = 'test me';
    Database db = await openSqlTableConnection();
    print(db.path);
    await db.delete('Items');
    await db.insert('Items', itemToTest.toMap());
    await db.execute("INSERT INTO Items VALUES ('meme', 123)");

    var res = await db.query('Items');
    print(res);
    db.close();
  }
}