import 'package:customizable_pos_system/model/item.dart';

/// Represents add-on for an [Item].
///
/// Note: [price] is the modifier to the base cost of the product.
/// <li> a -ve price indicates a refund/reduce in the cost amount.
/// <li> a +ve price indicates additional amount to be topped up.
class AddOn {
  String addOnName;
  double price;
}