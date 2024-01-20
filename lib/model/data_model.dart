import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;
  @HiveField(3)
  final double targetWeight;
  @HiveField(4)
  final double height;
  @HiveField(5)
  final double weight;
  @HiveField(6)
  final String sex;
  @HiveField(7)
  final String goal;
  @HiveField(8)
  final String dob;
  @HiveField(9)
  final double calo;

  UserModel({
    this.name = '',
    this.age = 0,
    this.targetWeight = 0,
    this.height = 0,
    this.weight = 0,
    this.goal = '',
    this.sex = '',
    this.dob = '',
    this.id,
    this.calo = 0,
  });
}
