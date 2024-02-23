// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/Foods/style.dart';
import 'package:project/model/data_dinner.dart';
import 'package:project/resipes/dinnermake.dart';
import 'package:project/resipes/dinnerview.dart';

class Dinner extends StatefulWidget {
  const Dinner({super.key});

  @override
  State<Dinner> createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dinner',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255)),
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
                      Hive.box<DinnerModel>('dinnerecipes').listenable(),
                  builder: (context, Box<DinnerModel> box, _) {
                    if (box.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 350,
                          ),
                          styledText('No dishes listed',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'lib/asset/starving.gif',
                            ),
                          )
                        ],
                      );
                    } else {
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
                              DinnerModel Drfood =
                                  box.getAt(index) as DinnerModel;
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) ()));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Dinnerview(
                                            drfood: Drfood,
                                          )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 10, left: 10),
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
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 55,
                                                  backgroundImage: FileImage(
                                                      File(Drfood.imagepath)),
                                                  // Replace with your image asset
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  Drfood.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
                                                )
                                              ],
                                            ),
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
                                            color: Colors.white,
                                            onPressed: () {
                                              _deletNotification(Drfood);
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
                    }
                  })),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DinnerMake()));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deletNotification(DinnerModel Drfood) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete recipe'),
          content: Text('Are you sure want to delete ${Drfood.title}'),
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
                  _delete(Drfood);
                },
                child: const Text('Yes'))
          ],
        );
      },
    );
  }

  void _delete(DinnerModel Drfood) {
    final Box<DinnerModel> Dinnerbox = Hive.box<DinnerModel>('Dinnerecipes');
    int index =
        Dinnerbox.values.toList().indexWhere((r) => r.title == Drfood.title);
    if (index != -1) {
      Dinnerbox.deleteAt(index);
    }
  }
}
