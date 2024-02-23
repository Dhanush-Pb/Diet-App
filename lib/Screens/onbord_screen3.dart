import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:project/Screens/onbord_screen4.dart';

class InBorder2 extends StatefulWidget {
  const InBorder2({Key? key}) : super(key: key);

  @override
  State<InBorder2> createState() => _InBorder1State();
}

class _InBorder1State extends State<InBorder2> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
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
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Lottie.asset('lib/asset/Animation - 1705068973145.json'),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create custom recipes and Save',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 180,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InBorder4()),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  // side: const BorderSide(
                  //     color: Color.fromARGB(255, 255, 255, 255), width: 2),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: const Size(100, 40) // Set the text color here
                  ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
