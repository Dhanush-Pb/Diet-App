import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_lunch.dart';
import 'package:project/resipes/Lunchmake.dart';
import 'package:project/resipes/Lunchview.dart';

class Lunch extends StatefulWidget {
  const Lunch({super.key});

  @override
  State<Lunch> createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Lunch',
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
                      Hive.box<LunchMOdel>('lunchrecipes').listenable(),
                  builder: (context, Box<LunchMOdel> box, _) {
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
                            LunchMOdel lrfood = box.getAt(index) as LunchMOdel;

                            return GestureDetector(
                              onTap: () {
                                // Nav Navigator.of(context).push(
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Lunchview(
                                          Lrfood: lrfood,
                                        )));
                                //     MaterialPageRoute(builder: (context) ()));
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
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 55,
                                                backgroundImage: FileImage(
                                                    File(lrfood.imagepath)),
                                                // Replace with your image asset
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                lrfood.title,
                                                style: GoogleFonts.actor(
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color.fromARGB(
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
                                            _deletNotification(lrfood);
                                            // Handle delete action
                                            // You ca
                                            //_n add your delete logic here
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Lunchmake()));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deletNotification(LunchMOdel lrfood) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete recipe'),
          content: Text('Are you sure want to delete ${lrfood.title}'),
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
                  _delete(lrfood);
                },
                child: const Text('Yes'))
          ],
        );
      },
    );
  }

  void _delete(LunchMOdel lrfood) {
    final Box<LunchMOdel> lunchbox = Hive.box<LunchMOdel>('lunchrecipes');
    int index =
        lunchbox.values.toList().indexWhere((r) => r.title == lrfood.title);
    if (index != -1) {
      lunchbox.deleteAt(index);
    }
  }
}
