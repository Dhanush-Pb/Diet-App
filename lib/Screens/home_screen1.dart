import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/Screen2/bmipage_widget.dart';
import 'package:project/Foods/foods.dart';
import 'package:project/Foods/Selected_food.dart';
import 'package:project/Foods/style.dart';
import 'package:project/Screen2/about.dart';
import 'package:project/Screens/local_notification.dart';
import 'package:project/Screen2/privacypolicy.dart';
import 'package:project/Screen2/readme.dart';
import 'package:project/db/db-function.dart';
import 'package:project/model/data_model.dart';
import 'package:project/model/data_totalcalories.dart';
import 'package:project/model/data_water.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  late Box<TotalCalories> totalCaloriesBox;

  int totalCalories = totalcalories12;
  late Timer _timer;

  int glassConsumed = 0;
  @override
  void initState() {
    getallUser();

    totalCaloriesBox = Hive.box<TotalCalories>('TotalCaloriesbox');

    _loadWaterintake();
    saveTotalCalories(totalcalories12);
    _starttimer();
    super.initState();
  }
  //waterfunction

  // ignore: unused_element
  void _loadWaterintake() async {
    // ignore: non_constant_identifier_names
    var WaterintakeBox = Hive.box<WaterintakeModel>('Waterbox');
    var currentdate = DateTime.now().toString().split(' ')[0];

    var waterintake = WaterintakeBox.get(currentdate,
        defaultValue: WaterintakeModel(0, currentdate));

    if (waterintake?.date != currentdate) {
      glassConsumed = 0;

      saveWaterIntake();
    } else {
      setState(() {
        glassConsumed = waterintake?.glassconsumed ?? 0;
      });
    }
  }

  void saveTotalCalories(int totalCalories) async {
    await totalCaloriesBox.put('totalCalories', TotalCalories(totalCalories));
  }

  @override
  void dispose() {
    _timer.cancel();
    totalCaloriesBox.listenable().removeListener(_onTotalCalories);
    super.dispose();
  }

  ///timer for notification automaticly
  void _starttimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (glassConsumed <= 8) {
        checkwaterintake();
      }
    });
  }

  ///notification of water
  void checkwaterintake() {
    if (glassConsumed <= 8) {
      // If water intake is zero, show a notification
      LocalNotification.showaimblenotification(
        title: "Hey ${userlistNotifier.value[0].name}",
        body: "Don't forget to drink water and stay hydrated!",
        payload: "water_intake_reminder",
      );
    }
  }

  void _onTotalCalories() {
    if (mounted) {
      setState(() {
        totalCalories = totalCaloriesBox
                .get('TotalCaloriesbox', defaultValue: TotalCalories(0))
                ?.total ??
            0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final Screenheight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: userlistNotifier,
        builder: (context, List<UserModel> userlis, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                backgroundColor: const Color.fromARGB(255, 197, 242, 250),
                actions: [
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AboutScreen()));
                          },
                          // ignore: sort_child_properties_last
                          child: const Text('About'),
                          value: 'About',
                        ),
                        PopupMenuItem(
                          // ignore: sort_child_properties_last
                          child: const Text('Privacy policy'),
                          value: 'privacy policy',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()));
                          },
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  width: screenWidth,
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
                          height: 5,
                        ),
                        Text('Hello ${userlis[0].name}',
                            style: GoogleFonts.archivo(
                                fontSize: 25, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Text('find,track and eat healthy food',
                        style: GoogleFonts.aBeeZee()),
                    const SizedBox(
                      height: 55,
                    ),
                    //GRAPH Show
                    Container(
                      height: 300,
                      width: 330,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(95, 53, 52, 52),
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.circular(35),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 113, 159, 197),
                              Color.fromARGB(255, 106, 204, 221),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                          )),
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Lottie.asset(
                                      'lib/asset/Animation - 1706678786234 (1).json',
                                      width: 45),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: CircularPercentIndicator(
                                animation: true,
                                animationDuration: 900,
                                radius: 85,
                                lineWidth: 13,
                                percent:
                                    (((userlis[0].calo) - totalcalories12) /
                                            (userlis[0].calo))
                                        .clamp(0.0, 1.0),
                                progressColor:
                                    const Color.fromARGB(255, 132, 0, 255),
                                backgroundColor:
                                    const Color.fromARGB(209, 233, 245, 255),
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (((userlis[0].calo) - totalcalories12) < 0
                                              ? 0
                                              : (userlis[0].calo) -
                                                  totalcalories12)
                                          .toStringAsFixed(0),
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    styledText('Cal remaining',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                styledText('Consumed',
                                    fontSize: 15, fontWeight: FontWeight.w400),
                                const SizedBox(
                                  width: 30,
                                ),
                                styledText('Total',
                                    fontSize: 15, fontWeight: FontWeight.w400)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Image.asset(
                                  'lib/asset/fire.png',
                                  width: 22,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$totalcalories12',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                Image.asset(
                                  'lib/asset/fire.png',
                                  width: 22,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  userlis[0].calo.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //BREAKFAST
                    Column(
                      children: [
                        const Readme(),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(127, 0, 0, 0)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 0.5,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Row(children: [
                              const Spacer(),
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                backgroundImage:
                                    AssetImage('lib/asset/breakfast.png'),
                                radius: 36,
                              ),
                              const Spacer(),
                              const Spacer(),
                              const Text(
                                'BreakFast',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Navcondition(
                                          appbartitle: 'Breakfast',
                                          appbarcolor: Color.fromARGB(
                                              255, 41, 145, 95))));
                                },
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const Navcondition(
                                                    appbartitle: 'Breakfast',
                                                    appbarcolor: Color.fromARGB(
                                                        255, 41, 145, 95))))
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  icon: Image.asset(
                                    'lib/asset/read.png',
                                    width: 30,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ]),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        //LUNCH
                        Padding(
                          padding: const EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(127, 0, 0, 0)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 0.5,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 8),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    backgroundImage: AssetImage(
                                        'lib/asset/—Pngtree—lunch clipart cartoon lunch box_5831876.png'),
                                    radius: 37,
                                  ),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Text(
                                  'Lunch',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const Navcondition(
                                          appbartitle: 'Lunch',
                                          appbarcolor: Color.fromARGB(
                                              255, 126, 16, 216)),
                                    ));
                                  },
                                  icon: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const Navcondition(
                                                      appbartitle: "Lunch",
                                                      appbarcolor:
                                                          Color.fromARGB(255,
                                                              126, 16, 216))))
                                          .then((value) {
                                        setState(() {});
                                      });
                                    },
                                    child: Image.asset(
                                      'lib/asset/read.png',
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        //DINNER
                        Padding(
                          padding: const EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(127, 0, 0, 0)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 0.5,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Row(
                              children: [
                                const Spacer(),
                                const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  backgroundImage:
                                      AssetImage('lib/asset/dinner.png'),
                                  radius: 28,
                                ),
                                const Spacer(
                                  flex: 4,
                                ),
                                const Text(
                                  'Dinner ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const Navcondition(
                                                    appbartitle: 'Dinner',
                                                    appbarcolor:
                                                        Color(0xFFF17C0E))))
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const Navcondition(
                                                      appbartitle: 'Dinner',
                                                      appbarcolor:
                                                          Color(0xFFF17C0E))))
                                          .then((value) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Image.asset(
                                      'lib/asset/read.png',
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),

                        //water part

                        Container(
                          height: 130,
                          width: 330,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 199, 247, 255),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 213, 236, 255),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(4),
                                bottomLeft: Radius.circular(4)),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(127, 0, 0, 0)
                                      .withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 0.5,
                                  offset: const Offset(0, 1))
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(children: [
                                const CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(255, 213, 236, 255),
                                  backgroundImage: AssetImage(
                                    'lib/asset/fill (2).png',
                                  ),
                                  radius: 40,
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Track Your Water',
                                      style: GoogleFonts.actor(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'consumption',
                                      style: GoogleFonts.actor(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ]),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        '$glassConsumed glass',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      const Spacer(),
                                      const Spacer(),
                                      const Spacer(),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              glassConsumed++;
                                              saveWaterIntake();
                                            });
                                          },
                                          child: Image.asset(
                                            'lib/asset/sign.png',
                                            width: 28,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          _starttimer();
                                        },
                                        icon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              glassConsumed =
                                                  (glassConsumed - 1)
                                                      .clamp(0, double.infinity)
                                                      .toInt();
                                              saveWaterIntake();
                                              // checkwaterintake();
                                              _starttimer();
                                            });
                                          },
                                          child: Image.asset(
                                            'lib/asset/delete.png',
                                            width: 28.5,
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 35,
                        ),
                        const BmiPageWidget()
                      ],
                    ),
                  ])))),
            ),
          );
        });
  }

  void saveWaterIntake() async {
    var waterIntakeBox = Hive.box<WaterintakeModel>('Waterbox');
    var currentDate = DateTime.now().toString().split(' ')[0];

    var waterIntake = waterIntakeBox.get(currentDate,
        defaultValue: WaterintakeModel(0, currentDate));

    waterIntake?.glassconsumed = glassConsumed; // corrected typo here
    await waterIntakeBox.put(currentDate, waterIntake!);
  }
}
