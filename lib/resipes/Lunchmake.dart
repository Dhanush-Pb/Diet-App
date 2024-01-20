import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Lunchmake extends StatefulWidget {
  const Lunchmake({super.key});

  @override
  State<Lunchmake> createState() => _LunchmakeState();
}

class _LunchmakeState extends State<Lunchmake> {
  final _titilecontroler = TextEditingController();
  final _ingrediencecontroller = TextEditingController();
  final _preparationcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Lunch Recipe',
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
                      controller: _titilecontroler,
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
                            const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
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
                      controller: _ingrediencecontroller,
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
                            const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
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
                      controller: _preparationcontroller,
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
                            const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
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
}
