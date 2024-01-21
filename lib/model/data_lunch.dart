import 'package:hive_flutter/hive_flutter.dart';
part 'data_lunch.g.dart';

@HiveType(typeId: 3)
class LunchMOdel extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String ingredients;

  @HiveField(2)
  late String prepration;
  @HiveField(3)
  late String imagepath;

  LunchMOdel(this.title, this.ingredients, this.prepration, this.imagepath);
}
