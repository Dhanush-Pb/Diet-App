import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_totalcalories.dart';
import 'package:project/model/data_water.dart';

int getotalCaloriesFordate(String date) {
  var totalCaloriesBox = Hive.box<TotalCalories>('TotalCaloriesbox');
  var totalCalories =
      totalCaloriesBox.get(date, defaultValue: TotalCalories(0, date));
  return totalCalories?.total ?? 0;
}

int getTotalwaterintakeforDate(String date) {
  // ignore: non_constant_identifier_names
  var WaterintakeBox = Hive.box<WaterintakeModel>('Waterbox');
  var waterintake =
      WaterintakeBox.get(date, defaultValue: WaterintakeModel(0, date));
  return waterintake?.glassconsumed ?? 0;
}

List<String> getAllDates() {
  var totalCaloriesBox = Hive.box<TotalCalories>('TotalCaloriesbox');
  List<String> allDates = totalCaloriesBox.keys.cast<String>().toList();
  return allDates;
}
