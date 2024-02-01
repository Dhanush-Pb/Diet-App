import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Screens/account.dart';
import 'package:project/Screens/home.dart';

import 'package:project/db/db-function.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()));
          },
          icon: Image.asset(
            'lib/asset/exit.png',
            width: screenWidth * 0.05,
          ),
        ),
        title: const Text(
          'Update Details',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(211, 245, 250, 1),
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
                padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05),
                child: Container(
                  height: screenHeight * 0.8,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 165, 145, 146),
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(115, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.025),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.02,
                                        screenHeight * 0.01,
                                        screenWidth * 0.02,
                                        screenHeight * 0.01),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.04,
                                        screenHeight * 0.02,
                                        screenWidth * 0.04,
                                        screenHeight * 0.02),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.04,
                                        screenHeight * 0.02,
                                        screenWidth * 0.04,
                                        screenHeight * 0.02),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.04,
                                        screenHeight * 0.02,
                                        screenWidth * 0.04,
                                        screenHeight * 0.02),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.04,
                                        screenHeight * 0.02,
                                        screenWidth * 0.04,
                                        screenHeight * 0.02),
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
                                      value: "Male",
                                      child: Text("Male"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Female",
                                      child: Text("Female"),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.04,
                                        screenHeight * 0.02,
                                        screenWidth * 0.04,
                                        screenHeight * 0.02),
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
                                      value: "Gain Weight",
                                      child: Text("Gain weight"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Maintain Weight",
                                      child: Text("Maintain Weight"),
                                    ),
                                    DropdownMenuItem(
                                      value: ('Lose weight'),
                                      child: Text('Lose weight'),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.04,
                                        screenHeight * 0.02,
                                        screenWidth * 0.04,
                                        screenHeight * 0.02),
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
                                                _targetWeightController.text,
                                              ),
                                              calo: calculatecalorie(
                                                  double.parse(
                                                      _weightController.text),
                                                  double.parse(
                                                      _heightController.text),
                                                  double.parse(
                                                      _targetWeightController
                                                          .text),
                                                  int.parse(
                                                      _ageController.text),
                                                  sexcontroller,
                                                  goalcontroller)));

                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pop(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Account()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
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

  double calculatecalorie(double weight, double height, double targetweight,
      int age, String sex, String goal) {
    double bmr;
    if (sex.toLowerCase() == 'Male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 444.7 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    if (goal == 'Lose weight') {
      bmr -= 500;
    } else if (goal == 'Gain Weight') {
      bmr += 500;
    }

    double caloriebudget = bmr * 1.2;
    caloriebudget = caloriebudget.roundToDouble();

    return caloriebudget;
  }
}
