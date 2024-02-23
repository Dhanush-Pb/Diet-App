// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:project/model/data_breakfast.dart';
import 'package:project/resipes/BreakfastEdit.dart';

class BreakfastView extends StatelessWidget {
  const BreakfastView({
    super.key,
    required this.Drfood,
  });
  final BreakfastModel Drfood;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    // ignore: prefer_const_constructors
                    .push(MaterialPageRoute(
                        builder: (context) => BreakfastEdit(
                              Drfood: Drfood,
                            )));
              },
              icon: const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
        centerTitle: true,
        title: const Text(
          ' Breakfast Recipe',
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
                    backgroundImage: FileImage(File(Drfood.imagepath)),
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 60, width: 350, value: Drfood.title),
                  const SizedBox(
                    height: 20,
                  ),
                  container(height: 110, width: 350, value: Drfood.ingredients),
                  const SizedBox(
                    height: 20,
                  ),
                  container(
                    height: 180,
                    width: 350,
                    value: Drfood.prepration,
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
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
