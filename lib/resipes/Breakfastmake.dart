import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/model/data_breakfast.dart';

class BreakfastMake extends StatefulWidget {
  const BreakfastMake({super.key});

  @override
  State<BreakfastMake> createState() => _BreakfastMakeState();
}

class _BreakfastMakeState extends State<BreakfastMake> {
  final titilecontroler = TextEditingController();
  final ingrediencecontroller = TextEditingController();
  final preparationcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Breakfast Recipe',
          style: GoogleFonts.actor(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 255, 255, 255),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
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
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
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
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
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
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
                    radius: 70,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? IconButton(
                            onPressed: _getImage,
                            icon: Image.asset(
                              'lib/asset/order-food.png',
                              width: 85,
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
                        // Do something with the form data
                        // For example, save the data to a database
                        _addbreakfastmodel();
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

  Future<void> _addbreakfastmodel() async {
    final Box<BreakfastModel> breakfastBox =
        await Hive.openBox<BreakfastModel>('breakreipes');

    final BreakfastModel newbreakfast = BreakfastModel(
        titilecontroler.text,
        ingrediencecontroller.text,
        preparationcontroller.text,
        _image?.path ?? '');

    breakfastBox.add(newbreakfast);
  }

  void _showsnackbar(BuildContext context, String mesg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.fromARGB(255, 37, 119, 185),
        content: Text(mesg),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
