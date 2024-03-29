import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:project/Screens/onbord_screen1.dart';
import 'package:project/Screens/onbord_screen3.dart';
import 'package:project/Screens/profile_screen.dart';

class InBorder22 extends StatefulWidget {
  const InBorder22({Key? key}) : super(key: key);

  @override
  State<InBorder22> createState() => _InBorder1State();
}

class _InBorder1State extends State<InBorder22> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const InBorder1()));
          },
        ),
        backgroundColor: const Color.fromARGB(255, 122, 208, 219),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: const Text(
                'skip >',
                style: TextStyle(fontWeight: FontWeight.w400),
              ))
        ],
      ),
      body: Container(
        width: screenwidth,
        height: Screenheight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 122, 208, 219), // Your starting color
              Color.fromARGB(255, 171, 58, 236), // Your ending color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset('lib/asset/Animation - 1705072154088.json'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your perfect diet is now available in',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Column(
              children: [
                Text(
                  'Just one tap',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const InBorder2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    minimumSize: const Size(100, 40) // Set the text color here
                    ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
