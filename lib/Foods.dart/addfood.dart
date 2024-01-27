import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Foods.dart/allfoods.dart';
import 'package:project/Screens/calorie.dart';
import 'package:project/model/data_food.dart';

class Addyfood extends StatefulWidget {
  const Addyfood({super.key});

  @override
  State<Addyfood> createState() => _AddyfoodState();
}

class _AddyfoodState extends State<Addyfood> {
  final foodnamecontroler = TextEditingController();
  final caloriescontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

// Add form key

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Add your food',
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
          child: SingleChildScrollView(
            child: Form(
              // Wrap with Form widget
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.09,
                          ),
                          Center(
                            child: SizedBox(
                              height: screenHeight * 0.02,
                              width: screenWidth * 0.5,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Lottie.asset(
                                  'lib/asset/Animation - 1706023312274 food.json',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          controller: foodnamecontroler,
                          maxLines: 1,
                          key: const Key('Food name'),
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'lib/asset/healthy-food.png',
                                width: 30,
                              ),
                            ),
                            fillColor: const Color.fromARGB(255, 235, 246, 247),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Food name',
                            contentPadding:
                                const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter food name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          controller: caloriescontroller,
                          maxLines: 1,
                          key: const Key('cal'),
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'lib/asset/calories.png',
                                width: 30,
                              ),
                            ),
                            fillColor: const Color.fromARGB(255, 235, 246, 247),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'calories',
                            contentPadding:
                                const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter food cal!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _onadd(context);
                              _showsnackbar(context, 'Added Sucecsses Fully');
                            }
                          },
                          style: TextButton.styleFrom(
                            elevation: 6,
                            shadowColor:
                                const Color.fromARGB(255, 105, 180, 112),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(251, 75, 167, 67),
                          ),
                          child: const Text('  Save  '),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showsnackbar(BuildContext context, String mesg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 40, 83, 226),
        content: Text(mesg),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onadd(BuildContext context) {
    final name = foodnamecontroler.text;
    final caloriestext = caloriescontroller.text;

    if (name.isNotEmpty && caloriestext.isNotEmpty) {
      final calories = int.parse(caloriestext);
      final newFoodItem = Fooditem(name: name, calories: calories);

      // Open the foodBox and add the new food item
      final foodBox = Hive.box<Fooditem>('foodBox');
      foodBox.add(newFoodItem);

      // Close the current screen and return the new food item
      Navigator.pop(context, newFoodItem);
    }
  }
}
