// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Foods.dart/Breakfastfoods.dart';

class BrakfastFood extends StatefulWidget {
  const BrakfastFood({super.key});

  @override
  State<BrakfastFood> createState() => _BrakfastFoodState();
}

class _BrakfastFoodState extends State<BrakfastFood> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Breakfast',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Today selected Food items',
                  style: TextStyle(fontSize: 19),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
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
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.minimize_rounded,
                                            color: Color.fromARGB(
                                                255, 224, 19, 19),
                                          )),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color:
                                              Color.fromARGB(255, 52, 181, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: const Text('food name'),
                                  subtitle: const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Calories:'),
                                      Text('quantity'),
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
                    height: screenHeight * 0.1,
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
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              elevation: 6,
                              shadowColor:
                                  const Color.fromARGB(255, 119, 78, 78),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              backgroundColor:
                                  const Color.fromARGB(250, 216, 91, 87),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                          child: const Text('Add to Diet'),
                        ),
                        const Spacer(),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BreakfastfoodsList()));
                          },
                          style: TextButton.styleFrom(
                            elevation: 6,
                            shadowColor:
                                const Color.fromARGB(255, 105, 180, 112),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    topLeft: Radius.circular(15))),
                            backgroundColor:
                                const Color.fromARGB(251, 75, 167, 67),
                          ),
                          child: const Text('Add Food'),
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
