import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/model/data_lunch.dart';

class Lunchmake extends StatefulWidget {
  const Lunchmake({super.key});

  @override
  State<Lunchmake> createState() => _LunchmakeState();
}

class _LunchmakeState extends State<Lunchmake> {
  final titilecontroler = TextEditingController();
  final ingrediencecontroller = TextEditingController();
  final preparationcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Lunch Recipe',
          style: GoogleFonts.actor(
            fontWeight: FontWeight.bold,
            fontSize:
                screenWidth * 0.06, // Adjust font size based on screen width
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
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.04,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05,
                    ),
                    child: TextFormField(
                      maxLength: 20,
                      maxLines: 1,
                      controller: titilecontroler,
                      key: const Key('Title'),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 235, 246, 247),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Recipe name',
                        contentPadding: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the recipe name!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: TextFormField(
                      maxLines: 3,
                      controller: ingrediencecontroller,
                      key: const Key('Ingredients'),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 235, 246, 247),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Ingredients',
                        contentPadding: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the ingredients!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: TextFormField(
                      maxLines: 6,
                      controller: preparationcontroller,
                      key: const Key('Preparation'),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 235, 246, 247),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Preparation',
                        contentPadding: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the preparation details!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  CircleAvatar(
                    radius: screenHeight * 0.09,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? IconButton(
                            onPressed: _getImage,
                            icon: Image.asset(
                              'lib/asset/order-food.png',
                              width: screenWidth * 0.3,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addlunchModel();
                        _showsnackbar(context, 'Recipe added successfully');
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Save details'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _addlunchModel() async {
    final Box<LunchMOdel> lunchBox =
        await Hive.openBox<LunchMOdel>('lunchrecipes');
    final LunchMOdel newlunch = LunchMOdel(
      titilecontroler.text,
      ingrediencecontroller.text,
      preparationcontroller.text,
      _image?.path ?? '',
    );

    lunchBox.add(newlunch);
  }

  void _showsnackbar(BuildContext context, String mesg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 37, 119, 185),
        content: Text(mesg),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
