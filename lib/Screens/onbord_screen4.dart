import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Screens/profile_screen.dart';

class InBorder4 extends StatefulWidget {
  const InBorder4({Key? key}) : super(key: key);

  @override
  State<InBorder4> createState() => _InBorder1State();
}

class _InBorder1State extends State<InBorder4> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: Screenheight,
        width: screenwidth,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Lottie.asset('lib/asset/Animation - 1705074441144.json',
                  width: 300),
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                const Center(
                  child: Text(
                    'Health is the Ultimate Happiness ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Lets Start the journy',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      // side: const BorderSide(
                      //     color: Color.fromARGB(255, 255, 255, 255), width: 2),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      minimumSize: Size(120, 40) // Set the text color here
                      ),
                  child: Text('Continue',
                      style: GoogleFonts.actor(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
