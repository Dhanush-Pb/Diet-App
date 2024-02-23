// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_model.dart';

ValueNotifier<List<UserModel>> userlistNotifier = ValueNotifier([]);

void adduser(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  // ignore: no_leading_underscores_for_local_identifiers
  final _id = await userDB.add(value);

  value.id = _id;
  userlistNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  userlistNotifier.notifyListeners();
}

Future<void> getallUser() async {
  final userDB = await Hive.openBox<UserModel>('user_db');

  userlistNotifier.value.clear();
  userlistNotifier.value.addAll(userDB.values);
}

Future<void> deleteuser(int id) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  await userDB.delete(id);

  getallUser();
}

// ignore: non_constant_identifier_names
Future<void> Updateuser(int id, UserModel updateduser) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  await userDB.put(id, updateduser);
  getallUser();
}

Future<bool> isLogdin() async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  return userDB.isNotEmpty;
}
