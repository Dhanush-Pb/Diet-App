import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_breakfast.dart';
import 'package:project/resipes/breakfastmake.dart';
import 'package:project/resipes/breakfastview.dart';

// ignore: camel_case_types
class breakfast extends StatefulWidget {
  const breakfast({super.key});

  @override
  State<breakfast> createState() => _breakfastState();
}

// ignore: camel_case_types
class _breakfastState extends State<breakfast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Breakfast',
          style: GoogleFonts.actor(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(255, 120, 184, 196),
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
            child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<BreakfastModel>('breakreipes').listenable(),
                builder: (context, Box<BreakfastModel> box, _) {
                  return Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: box.length,
                        itemBuilder: (BuildContext context, int index) {
                          BreakfastModel brfood =
                              box.getAt(index) as BreakfastModel;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      BreakfastView(Drfood: brfood)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 116, 129, 199),
                                      Color.fromARGB(255, 140, 180, 206),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),

                                  color: Color.fromARGB(255, 214, 200, 191),
                                  // Replace with your desired color
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 15),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                              radius: 55,
                                              backgroundImage: FileImage(
                                                  File(brfood.imagepath))
                                              // Replace with your image asset
                                              ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            brfood.title,
                                            style: GoogleFonts.actor(
                                                fontWeight: FontWeight.w500,
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 3,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 30,
                                        ),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        onPressed: () {
                                          _deletNotification(brfood);
                                          // Handle delete action
                                          // You can add your delete logic here
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BreakfastMake()));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deletNotification(BreakfastModel brfood) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete recipe'),
          content: Text('Are you sure want to delete ${brfood.title}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _delete(brfood);
                },
                child: const Text('Yes'))
          ],
        );
      },
    );
  }

  void _delete(BreakfastModel brfood) {
    final Box<BreakfastModel> breakfastbox =
        Hive.box<BreakfastModel>('breakreipes');
    int index =
        breakfastbox.values.toList().indexWhere((r) => r.title == brfood.title);
    if (index != -1) {
      breakfastbox.deleteAt(index);
    }
  }
}
