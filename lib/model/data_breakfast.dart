import 'dart:core';

import 'package:hive_flutter/adapters.dart';
part 'data_breakfast.g.dart';

@HiveType(typeId: 1)
class BreakfastModel extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String ingredients;
  @HiveField(2)
  late String prepration;
  @HiveField(3)
  late String imagepath;

  BreakfastModel(this.title, this.ingredients, this.prepration);
}
