import 'package:hive_flutter/hive_flutter.dart';
part 'data_food.g.dart';

@HiveType(typeId: 5)
class Fooditem extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int calories;
  Fooditem({required this.name, required this.calories});
}
