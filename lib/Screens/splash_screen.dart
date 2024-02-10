import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/Screens/home_screen.dart';
import 'package:project/Screens/onbord_screen1.dart';

import 'package:project/db/db-function.dart';

class spalsh extends StatefulWidget {
  const spalsh({super.key});

  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {
  @override
  void initState() {
    // TODO: implement initState
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
}
