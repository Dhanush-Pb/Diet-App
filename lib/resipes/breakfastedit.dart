import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/data_breakfast.dart';

class BreakfastEdit extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final BreakfastModel Drfood;
  // ignore: prefer_const_constructors_in_immutables, non_constant_identifier_names
  BreakfastEdit({super.key, required this.Drfood});

  @override
  State<BreakfastEdit> createState() => _BreakfastEditState();
}

class _BreakfastEditState extends State<BreakfastEdit> {
  final ingredientcontroler = TextEditingController();

  final preprationcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ingredientcontroler.text = widget.Drfood.ingredients;
    preprationcontroller.text = widget.Drfood.prepration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Breakfast Recipe',
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
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 23, right: 23),
                  child: TextFormField(
                    maxLength: 20,
                    maxLines: 1,
                    controller: ingredientcontroler,
                    key: const Key('ingredients'),
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 235, 246, 247),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'ingredients',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Edit here!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: TextFormField(
                    maxLines: 6,
                    controller: preprationcontroller,
                    key: const Key('Prepration'),
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 235, 246, 247),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Preprartion',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Edit here!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            maximumSize: const Size(120, 40),
                            backgroundColor:
                                const Color.fromARGB(255, 129, 216, 48),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _updatefood();
                            Navigator.pop(context, widget.Drfood);
                            Navigator.pop(context);
                            _showsnackbar(context);
                          }
                        },
                        child: const Text(
                          'Save Details',
                          style: TextStyle(),
                        )),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _updatefood() async {
    widget.Drfood.ingredients = ingredientcontroler.text;
    widget.Drfood.prepration = preprationcontroller.text;

    var box = await Hive.openBox<BreakfastModel>('breakreipes');
    int index = box.values.toList().indexOf(widget.Drfood);

    await box.putAt(index, widget.Drfood);
  }

  void _showsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 47, 108, 158),
        content: Text('Recipe updated'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
