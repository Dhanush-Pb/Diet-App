import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Screens/calorie_screen.dart';

import 'package:project/db/db-function.dart';

import 'package:project/model/data_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _namecontroler = TextEditingController();
  final _agecontroller = TextEditingController();
  // final _dobcontroller = TextEditingController();
  final _heightcontroller = TextEditingController();
  final _weightcontroller = TextEditingController();
  final _targetwecontroller = TextEditingController();
  var _goalcontroler = 'Lose weight';
  var _sexcontroler = 'Male';
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    getallUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 252, 255),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Color.fromARGB(255, 247, 243, 207),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Lottie.asset(
                        'lib/asset/Animation - 1705125238646p.json',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Create a Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextFormField(
                      controller: _namecontroler,
                      key: const Key('enter name'),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 235, 246, 247),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Name',
                        labelText: 'Enter your name',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the user Name!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _heightcontroller,
                        key: const Key(''),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 235, 246, 247),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Height',
                          labelText: 'Height : cm',
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Height is required!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _weightcontroller,
                        key: const Key('weight'),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 235, 246, 247),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Weight',
                          labelText: 'Weight : kg',
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Weight is required!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _agecontroller,
                        key: const Key('Age'),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 235, 246, 247),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Age',
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Age is required!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: DropdownButtonFormField<String>(
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
                        value: _sexcontroler,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 235, 246, 247),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Sex',
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Your gender is required!';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String? value) {
                          _sexcontroler = value!;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                child: DropdownButtonFormField<String>(
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
                  value: _goalcontroler,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 235, 246, 247),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Your primary goal',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your primary goal is required!';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String? value) {
                    _goalcontroler = value!;
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: _targetwecontroller,
                      key: const Key('Target Weight'),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 235, 246, 247),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Target weight',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Target weight is required!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    UserModel user = UserModel(
                      name: _namecontroler.text,
                      age: int.parse(_agecontroller.text),
                      targetWeight: double.parse(_targetwecontroller.text),
                      height: double.parse(_heightcontroller.text),
                      weight: double.parse(_weightcontroller.text),
                      goal: _goalcontroler,
                      sex: _sexcontroler,
                      // dob: _dobcontroller.text,
                      calo: calculatecalorie(
                          double.parse(_weightcontroller.text),
                          double.parse(_heightcontroller.text),
                          double.parse(_targetwecontroller.text),
                          int.parse(_agecontroller.text),
                          _sexcontroler,
                          _goalcontroler),
                    );

                    adduser(user);
                    // Your save logic here
                    getallUser();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Calories()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), width: 2),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                child: const Text('Save'),
              ),
              const SizedBox(
                height: 90,
              ),
              const Column(
                children: [
                  Text(
                    'By Continuing you agree to Nutri fuel',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Privacy policy & Terms of use',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 154, 255),
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  )
                ],
              )
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
