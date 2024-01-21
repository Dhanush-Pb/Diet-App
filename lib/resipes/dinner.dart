import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
        title: Text(
          'Dinner',
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
                      Hive.box<DinnerModel>('dinnerecipes').listenable(),
                  builder: (context, Box<DinnerModel> box, _) {
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
                            // ignore: non_constant_identifier_names
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
                                        padding: const EdgeInsets.only(
                                            left: 30, top: 15),
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
          title: Text('Delete recipe'),
          content: Text('Are you sure want to delete ${Drfood.title}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _delete(Drfood);
                },
                child: Text('Yes'))
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
