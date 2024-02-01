import 'package:hive_flutter/hive_flutter.dart';
part 'data_water.g.dart';

@HiveType(typeId: 8)
class WaterintakeModel {
  @HiveField(0)
  int glassconsumed;
  @HiveField(1)
  String date;

  WaterintakeModel(this.glassconsumed, [this.date = '']);
}
