import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Screens/Update.dart';
import 'package:project/db/db-function.dart';
import 'package:project/model/data_model.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

int _selectedIndex = 3;

class _AccountState extends State<Account> {
  UserModel? user;
  Box<UserModel>? userbox;

  @override
  void initState() {
    super.initState();
    getallUser();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: userlistNotifier,
        builder: (context, list, child) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(147, 201, 211, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 250,
                          alignment: Alignment.center,
                          child: Lottie.asset(
                            'lib/asset/Animation - 1705215973305 details.json',
                            width: 480,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                              height: 389,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(200, 255, 255, 255),
                              ),
                              child: Column(
                                children: [
                                  userdetails('Name', list[0].name),
                                  userdetails('Age', list[0].age.toString()),
                                  userdetails(
                                      'Height', list[0].height.toString()),
                                  userdetails(
                                      'Weight', list[0].weight.toString()),
                                  userdetails('Sex', list[0].sex),
                                  userdetails('Primary goal', list[0].goal),
                                  userdetails('Target Weight',
                                      list[0].targetWeight.toString()),
                                ],
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => const Update()))
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: .1),
                                // ignore: prefer_const_constructors
                                foregroundColor: Color.fromARGB(255, 0, 0, 0),
                              ),
                              child: Text(
                                'Edit Details',
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget userdetails(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const Spacer(),
              Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1.5,
        ),
      ],
    );
  }
}
