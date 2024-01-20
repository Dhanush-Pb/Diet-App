import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/account.dart';
import 'package:project/db/db-function.dart';
import 'package:project/home.dart';

import 'package:project/model/data_model.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  get user => null;

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var _nameController = TextEditingController();
  var _ageController = TextEditingController();
  var _dobController = TextEditingController();
  var _heightController = TextEditingController();
  var _weightController = TextEditingController();
  var _targetWeightController = TextEditingController();
  var sexcontroller = 'Male';
  var goalcontroller = 'Lose weight';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameController =
        TextEditingController(text: userlistNotifier.value[0].name);
    _ageController =
        TextEditingController(text: userlistNotifier.value[0].age.toString());
    _dobController = TextEditingController(text: userlistNotifier.value[0].dob);
    _heightController = TextEditingController(
        text: userlistNotifier.value[0].height.toString());
    _weightController = TextEditingController(
        text: userlistNotifier.value[0].weight.toString());
    _targetWeightController = TextEditingController(
        text: userlistNotifier.value[0].targetWeight.toString());
    sexcontroller = userlistNotifier.value[0].sex;
    goalcontroller = userlistNotifier.value[0].goal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            icon: Image.asset(
              'lib/asset/exit.png',
              width: 25,
            )),
        title: const Text(
          'Update Details',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(211, 245, 250, 1),
        // leading: BackButton(onPressed: () {
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context) => const Account()));
        // }),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(211, 245, 250, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
                child: Container(
                  height: 700,
                  width: 290,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 165, 145, 146),
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(115, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Form(
                      key: _formKey,
                      child: ValueListenableBuilder(
                          valueListenable: userlistNotifier,
                          builder: (context, list, child) {
                            return Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  key: const Key('enter name'),
                                  keyboardType: TextInputType.name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Name',
                                    labelText: 'Change your name',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        12.0, 8.0, 12.0, 8.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Change the user Name!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Spacer(),
                                TextFormField(
                                  controller: _heightController,
                                  key: const Key('height'),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Height',
                                    labelText: 'Height : cm',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Height is required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Spacer(),
                                TextFormField(
                                  controller: _weightController,
                                  key: const Key('weight'),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Weight',
                                    labelText: 'Weight : kg',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Weight is required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Spacer(),
                                // TextFormField(
                                //   controller: _dobController,
                                //   key: const Key('DOB'),
                                //   keyboardType: TextInputType.datetime,
                                //   autovalidateMode:
                                //       AutovalidateMode.onUserInteraction,
                                //   decoration: InputDecoration(
                                //     fillColor: const Color.fromARGB(
                                //         255, 235, 246, 247),
                                //     filled: true,
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     labelText: 'DOB:     DD/MM/YYYY',
                                //     contentPadding: const EdgeInsets.fromLTRB(
                                //         20.0, 10.0, 20.0, 10.0),
                                //   ),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return ' UpdatDate of birth is required!';
                                //     } else {
                                //       return null;
                                //     }
                                //   },
                                // ),
                                // const Spacer(),
                                TextFormField(
                                  controller: _ageController,
                                  key: const Key('Age'),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Age',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Age is required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Spacer(),
                                TextFormField(
                                  controller: _targetWeightController,
                                  key: const Key('Target Weight'),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Target weight',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Target weight is required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Spacer(),
                                DropdownButtonFormField<String>(
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("Male"),
                                      value: "Male",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Female"),
                                      value: "Female",
                                    ),
                                  ],
                                  value: sexcontroller,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Sex',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Your gender is required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (String? value) {
                                    sexcontroller = value!;
                                  },
                                ),
                                const Spacer(),
                                DropdownButtonFormField<String>(
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("Gain weight"),
                                      value: "Gain Weight",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Maintain Weight"),
                                      value: "Maintain Weight",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Lose weight'),
                                      value: ('Lose weight'),
                                    )
                                  ],
                                  value: goalcontroller,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 235, 246, 247),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Your primary goal',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Your primary goal is required!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (String? value) {
                                    goalcontroller = value!;
                                  },
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await Updateuser(
                                          userlistNotifier.value[0].key,
                                          UserModel(
                                              age: int.parse(
                                                  _ageController.text),
                                              name: _nameController.text,
                                              dob: _dobController.text,
                                              goal: goalcontroller,
                                              height: double.parse(
                                                  _heightController.text),
                                              weight: double.parse(
                                                  _weightController.text),
                                              sex: sexcontroller,
                                              id: 0,
                                              targetWeight: double.parse(
                                                  _targetWeightController
                                                      .text)));

                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pop(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Account()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // side: const BorderSide(
                                    //   color: Color.fromARGB(255, 165, 145, 146),
                                    //   width: 1,
                                    // ),
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.actor(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                    height: 16), // Add some space at the bottom
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
