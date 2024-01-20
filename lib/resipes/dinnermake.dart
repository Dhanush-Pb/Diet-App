import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DinnerMake extends StatefulWidget {
  const DinnerMake({Key? key}) : super(key: key);

  @override
  State<DinnerMake> createState() => _DinnerMakeState();
}

class _DinnerMakeState extends State<DinnerMake> {
  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _preparationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Create Dinner Recipe'),
      body: buildBody(),
    );
  }

  PreferredSize buildAppBar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.actor(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 87, 182),
      ),
    );
  }

  Widget buildBody() {
    return Container(
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
                buildTextFormField(
                  controller: _titleController,
                  label: 'Recipe name',
                  key: const Key('Title'),
                  keyboardType: TextInputType.name,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the recipe name!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                buildTextFormField(
                  controller: _ingredientsController,
                  label: 'Ingredients',
                  key: const Key('Ingredients'),
                  keyboardType: TextInputType.name,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the ingredients!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                buildTextFormField(
                  controller: _preparationController,
                  label: 'Preparation',
                  key: const Key('Preparation'),
                  keyboardType: TextInputType.name,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the preparation details!';
                    } else {
                      return null;
                    }
                  },
                ),
                buildYourWidgetFunction(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String label,
    required Key key,
    required TextInputType keyboardType,
    required EdgeInsets contentPadding,
    required FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        key: key,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 235, 246, 247),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          contentPadding: contentPadding,
        ),
        validator: validator,
      ),
    );
  }

  Widget buildYourWidgetFunction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCircleAvatar(),
        const SizedBox(height: 10),
        buildElevatedButton(),
      ],
    );
  }

  Widget buildCircleAvatar() {
    return CircleAvatar(
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
    );
  }

  Widget buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Do something with the form data
          // For example, save the data to a database
          Navigator.of(context).pop();
        }
      },
      child: const Text('Save details'),
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
