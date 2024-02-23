import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project/Screens/home_screen.dart';
import 'package:project/Screens/onbord_screen1.dart';

import 'package:project/db/db_function.dart';

// ignore: camel_case_types
class spalsh extends StatefulWidget {
  const spalsh({super.key});

  @override
  State<spalsh> createState() => _spalshState();
}

// ignore: camel_case_types
class _spalshState extends State<spalsh> {
  @override
  void initState() {
    permission();
    Gonext();
    getallUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              radius: 80,
              child: Image.asset(
                'lib/asset/logo-nutri.png',
                width: 160,
              ),
            ),
          ),
          Column(
            children: [
              const Expanded(child: SizedBox()),
              Center(
                child: SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(167, 105, 11, 255)),
                    borderRadius: BorderRadius.circular(100),
                    minHeight: 7,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> Gonext() async {
    await Future.delayed(const Duration(seconds: 2));
    bool a = await isLogdin();
    a
        // ignore: use_build_context_synchronously
        ? Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
            return const Home();
          }))
        // ignore: use_build_context_synchronously
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const InBorder1()));
  }

  Future<void> permission() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }
}
