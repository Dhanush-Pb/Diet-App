import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Lunchview extends StatefulWidget {
  const Lunchview({super.key});

  @override
  State<Lunchview> createState() => _LunchviewState();
}

class _LunchviewState extends State<Lunchview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Lunch Recipe',
          style: GoogleFonts.actor(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 87, 182),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 197, 242, 250),
                Color.fromRGBO(255, 255, 255, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 80, width: 350),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 160, width: 350),
                  const SizedBox(
                    height: 20,
                  ),
                  container(
                    height: 180,
                    width: 350,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget container({double? height, double? width}) {
    return Container(
      height: height ?? 90, // If height is not provided, default to 90
      width: width ?? 350, // If width is not provided, default to 350
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromARGB(255, 226, 218, 206),
      ),
      child: const Column(
        children: [Text('')],
      ),
    );
  }
}
