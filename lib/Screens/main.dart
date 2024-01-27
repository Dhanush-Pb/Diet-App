import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_breakfast.dart';
import 'package:project/model/data_dinner.dart';
import 'package:project/model/data_food.dart';
import 'package:project/model/data_lunch.dart';
import 'package:project/model/data_model.dart';

import 'package:project/Screens/splash.dart';
import 'package:project/model/data_selectedfood.dart';
import 'package:project/model/data_totalcalories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('user_db');
  Hive.registerAdapter(BreakfastModelAdapter());
  await Hive.openBox<BreakfastModel>('breakreipes');
  Hive.registerAdapter(LunchMOdelAdapter());
  await Hive.openBox<LunchMOdel>('lunchrecipes');
  Hive.registerAdapter(DinnerModelAdapter());
  await Hive.openBox<DinnerModel>('dinnerecipes');
  Hive.registerAdapter(FooditemAdapter());
  await Hive.openBox<Fooditem>('foodBox');
  Hive.registerAdapter(SelectedfooditemAdapter());
  await Hive.openBox<Selectedfooditem>('selectedfoodbox');
  Hive.registerAdapter(TotalCaloriesAdapter());
  await Hive.openBox<TotalCalories>('TotalCaloriesbox');
  //potrait lock
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 70, 128, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: spalsh(),
    );
  }
}
