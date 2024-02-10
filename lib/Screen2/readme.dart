import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Foods/style.dart';
import 'package:project/Screen2/yoga_page.dart';

class Readme extends StatefulWidget {
  const Readme({super.key});

  @override
  State<Readme> createState() => _ReadmeState();
}

class _ReadmeState extends State<Readme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 80,
      width: 270,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 209, 52, 52),
              Color.fromARGB(255, 73, 76, 255),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 0.1,
                offset: const Offset(0, 2))
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Lottie.asset(
              'lib/asset/Animation - 1707479484710.json',
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Yogapage()));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 30),
                  backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
              child: styledText("Explore Yoga",
                  fontSize: 11.5, fontWeight: FontWeight.bold)),
          const Spacer(),
        ],
      ),
    );
  }
}
