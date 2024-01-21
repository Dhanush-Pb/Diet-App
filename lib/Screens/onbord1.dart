import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Screens/onbord2.dart';

class InBorder1 extends StatefulWidget {
  const InBorder1({Key? key}) : super(key: key);

  @override
  State<InBorder1> createState() => _InBorder1State();
}

class _InBorder1State extends State<InBorder1> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 208, 219),
      body: Container(
        width: screenwidth,
        height: Screenheight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 122, 208, 219),
            Color.fromARGB(255, 171, 58, 236),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            SingleChildScrollView(
              child: Center(
                child: Lottie.asset('lib/asset/Animation - 1705067403205.json'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Text(
                  'NUTRI FUEL',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 190,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InBorder22()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      // side: const BorderSide(
                      //     color: Color.fromARGB(255, 255, 255, 255), width: 2),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      minimumSize:
                          const Size(130, 40) // Set the text color here
                      ),
                  child: Text(
                    'Lets go',
                    style: GoogleFonts.actor(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
