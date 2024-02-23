import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/model/data_dinner.dart';
import 'package:project/resipes/Dinneredit.dart';

class Dinnerview extends StatelessWidget {
//   final Drfood drfood;
  final DinnerModel drfood;

  // Modify the constructor to accept DinnerModel
  const Dinnerview({Key? key, required this.drfood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DinnerEdit(drfood: drfood)));
              },
              icon: const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
        centerTitle: true,
        title: const Text(
          ' Dinner Recipe',
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
                  backgroundImage: FileImage(File(drfood.imagepath)),
                  // Assuming you have an 'imageFile' property in your Drfood class
                ),
                const SizedBox(
                  height: 20,
                ),
                container(height: 60, width: 350, value: drfood.title),
                const SizedBox(
                  height: 20,
                ),
                container(height: 110, width: 350, value: drfood.ingredients),
                const SizedBox(
                  height: 20,
                ),
                container(
                  height: 180,
                  width: 350,
                  value: drfood.prepration,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget container({double? height, double? width, required String value}) {
    return Container(
      height: height ?? 90,
      width: width ?? 350,
      decoration: BoxDecoration(
        border: Border.all(width: .2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
