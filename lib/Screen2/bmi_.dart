// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:project/Foods/style.dart';

class Bmipage extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  const Bmipage({super.key, Key});

  @override
  State<Bmipage> createState() => _BmipageState();
}

class _BmipageState extends State<Bmipage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double bmiResult = 0.0;
  String resultStatus = '';
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white, // Change the color of the back button here
          ),
          centerTitle: true,
          title: styledText('Calculate Your BMI'),
          backgroundColor: const Color.fromARGB(255, 0, 38, 255),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenheight,
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
                child: Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'lib/asset/girl-standing-scale-flat-vector-illustration-woman-trying-control-weight-with-help-diet-body-mass-index-chart-with-normal-overweight-obese-color-blocks-underweight-bmi-fitness-concept_74855-.png',
                        width: 250,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 15, right: 5, bottom: 15),
                            child: styledText('Select Gender: ',
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          DropdownButton<String>(
                              value: selectedGender,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                });
                              },
                              style: const TextStyle(
                                  color: Color.fromARGB(66, 38, 0, 255)),
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: Colors.blue,
                              ),
                              items: ['Male', 'Female'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: styledText(value,
                                      color:
                                          const Color.fromARGB(255, 6, 31, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                );
                              }).toList())
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Enter Your weight (kg)',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Enter Your Height (Cm)',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          calculatebmi();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue), // Change the background color
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Change the border radius as needed
                              // You can adjust other properties like side if you want
                            ),
                          ),
                        ),
                        child: styledText('Calculate BMI', fontSize: 15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      styledText('BMI :${bmiResult.toStringAsFixed(2)}',
                          color: const Color.fromARGB(255, 255, 0, 0)),
                      const SizedBox(
                        height: 15,
                      ),
                      styledText('Result :$resultStatus',
                          color: bmicolor(bmiResult)),
                      const SizedBox(
                        height: 25,
                      ),
                      if (bmiResult >= 18.5 && bmiResult < 24.9) ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: styledText(
                              'Your Current weight is within the normal range for Bmi',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              textAlign: TextAlign.center),
                        ),
                      ] else ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: styledText(
                              'If your BMI is 18.5 to 24.9, it falls within the Healthy Weight range',
                              color: Colors.black,
                              fontSize: 15,
                              textAlign: TextAlign.center),
                        ),
                      ],
                      Lottie.asset('lib/asset/Animation - 1707302275686.json')
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ));
  }

  void calculatebmi() {
    if (weightController.text.isEmpty || heightController.text.isEmpty) {
      setState(() {
        bmiResult = 0.0;
        resultStatus = 'Enter valid weight and height           ';
      });
      return;
    }
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    if (weight > 0 && height > 0) {
      double heightmeter = height / 100;
      double bmi;

      if (selectedGender == 'Male') {
        bmi = weight / (heightmeter * heightmeter);
      } else {
        bmi = weight / (1.08 * heightmeter * heightmeter);
      }
      setState(() {
        bmiResult = bmi;
        resultStatus = getbmistatus(bmi);
      });
    } else {
      setState(() {
        bmiResult = 0.0;
        resultStatus = 'invalid input Enter valid values';
      });
    }
  }

  String getbmistatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 33 && bmi < 34.9) {
      return 'obese'; // Corrected spelling of 'obese'
    } else {
      return 'Extremely obese'; // Corrected spelling of 'obese'
    }
  }

  Color bmicolor(double bmi) {
    if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else {
      return const Color.fromARGB(255, 255, 17, 0);
    }
  }
}
