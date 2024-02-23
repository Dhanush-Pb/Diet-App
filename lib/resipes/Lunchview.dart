// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/model/data_lunch.dart';
import 'package:project/resipes/lunchedit.dart';

class Lunchview extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final LunchMOdel Lrfood;

  // ignore: non_constant_identifier_names
  const Lunchview({Key? key, required this.Lrfood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LunchEdit(lrfood: Lrfood)));
              },
              icon: const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
        centerTitle: true,
        title: const Text(
          ' Lunch Recipe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
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
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(File(Lrfood.imagepath)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 60, width: 350, value: Lrfood.title),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 110, width: 350, value: Lrfood.ingredients),
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
      decoration: BoxDecoration(
        border: Border.all(width: .2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
