import 'package:hive_flutter/hive_flutter.dart';
part 'data_totalcalories.g.dart';

@HiveType(typeId: 7)
class TotalCalories {
  @HiveField(0)
  final int total;
  @HiveField(1)
  final String date;

  TotalCalories(this.total, [this.date = '']);
}
