import 'package:hive_flutter/hive_flutter.dart';
part 'data_dinner.g.dart';

@HiveType(typeId: 4)
class DinnerModel extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String ingredients;
  @HiveField(2)
  late String prepration;
  @HiveField(3)
  late String imagepath;

  DinnerModel(this.title, this.ingredients, this.prepration, this.imagepath);
}
