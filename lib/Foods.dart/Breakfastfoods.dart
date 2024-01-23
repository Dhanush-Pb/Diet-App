import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Foods.dart/addfood.dart';
import 'package:project/Foods.dart/searchwidget.dart';

class BreakfastfoodsList extends StatefulWidget {
  const BreakfastfoodsList({super.key});

  @override
  State<BreakfastfoodsList> createState() => _BreakfastfoodsListState();
}

class _BreakfastfoodsListState extends State<BreakfastfoodsList> {
  // ignore: prefer_final_fields

  ValueNotifier<bool> _searchNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _searchNotifier.value = !_searchNotifier.value;
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
        centerTitle: true,
        title: Text(
          'Select Breakfast Food ',
          style: GoogleFonts.actor(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 87, 182),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              coustm(
                search: SearchController(),
                searchnotifier: _searchNotifier,
              ),

              const SizedBox(),
              // ignore: avoid_unnecessary_containers
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Card(
                                // Customize your card widget here
                                child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: Color.fromARGB(
                                                255, 38, 151, 34),
                                          )),
                                    ],
                                  ),
                                  title: const Text('food name'),
                                  subtitle: const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Calories:'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0,
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 197, 242, 250),
                          Color.fromRGBO(225, 252, 253, 1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Addyfood()));
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 6,
                              shadowColor:
                                  const Color.fromARGB(255, 119, 78, 78),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor:
                                  const Color.fromARGB(249, 73, 177, 78),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                          child: const Text('Add your food'),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
