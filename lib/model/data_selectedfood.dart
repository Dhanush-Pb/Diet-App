import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_food.dart';

part 'data_selectedfood.g.dart';

@HiveType(typeId: 6)
class Selectedfooditem extends HiveObject {
  @HiveField(0)
  final Fooditem fooditem;
  @HiveField(1)
  int quantity;
  Selectedfooditem(this.fooditem, this.quantity);
}
