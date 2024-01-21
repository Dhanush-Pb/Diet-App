import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/data_lunch.dart';

class Lunchview extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final LunchMOdel Lrfood;

  const Lunchview({Key? key, required this.Lrfood}) : super(key: key);

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
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(File(Lrfood.imagepath)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 70, width: 350, value: Lrfood.title),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 120, width: 350, value: Lrfood.ingredients),
                  const SizedBox(
                    height: 20,
                  ),
                  container(
                    height: 160,
                    width: 350,
                    value: Lrfood.prepration,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget container({double? height, double? width, required String value}) {
    return Container(
      height: height ?? 90, // If height is not provided, default to 90
      width: width ?? 350, // If width is not provided, default to 350
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromARGB(255, 226, 218, 206),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
