// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project/db/db_record.dart';
import 'package:project/model/data_totalcalories.dart';
import 'package:project/model/data_water.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Your Records',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 48, 109, 221),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 203, 249, 255),
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
                            Hive.box<TotalCalories>('TotalCaloriesbox')
                                .listenable(),
                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        builder: (context, totalCaloriesBox, Widget) {
                          return ValueListenableBuilder(
                              valueListenable:
                                  Hive.box<WaterintakeModel>('Waterbox')
                                      .listenable(),
                              // ignore: non_constant_identifier_names
                              builder: (context, WaterintakeBox, Widget) {
                                return Column(children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: getAllDates().length > 1
                                          ? getAllDates().length - 2
                                          : 0,
                                      itemBuilder: (context, index) {
                                        String date = getAllDates()[index];
                                        int totalCalories =
                                            getotalCaloriesFordate(date);
                                        int totalwater =
                                            getTotalwaterintakeforDate(date);
                                        return Card(
                                          color: const Color.fromARGB(
                                              255, 92, 92, 194),
                                          elevation: 5,
                                          margin: const EdgeInsets.only(
                                              top: 20, left: 30, right: 30),
                                          child: ListTile(
                                            subtitle: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                        DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(DateTime
                                                                .parse(date)),
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255))),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      'Water intake',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                    ),
                                                    Text(
                                                      '$totalwater glass',
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                        'Calories intake',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255))),
                                                    Text(
                                                      '$totalCalories kcal',
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                              ],
                                            ),
                                            // Customize ListTile as needed
                                          ),
                                        );
                                      })
                                ]);
                              });
                        })))));
  }
}
