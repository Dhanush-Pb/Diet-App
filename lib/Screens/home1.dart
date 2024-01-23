import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Foods.dart/SelectedBreakfast.dart';
import 'package:project/db/db-function.dart';
import 'package:project/model/data_model.dart';

class Home1 extends StatefulWidget {
  const Home1({
    super.key,
  });

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  void initState() {
    getallUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
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
                          const PopupMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text('About'),
                            value: 'About',
                          ),
                          const PopupMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text('Privacy policy'),
                            value: 'privacy policy',
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: screenwidth,
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
                          height: 190,
                          width: 310,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 113, 159, 197),
                                  Color.fromARGB(255, 127, 205, 219),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                              )),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        //BREAKFAST
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                height: 70,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              const Color.fromARGB(127, 0, 0, 0)
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BrakfastFood()));
                                    },
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BrakfastFood()));
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
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                height: 70,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              const Color.fromARGB(127, 0, 0, 0)
                                                  .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 0.5,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 8),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        backgroundImage: AssetImage(
                                            'lib/asset/—Pngtree—lunch clipart cartoon lunch box_5831876.png'),
                                        radius: 37,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Spacer(),
                                    Spacer(),
                                    const Text(
                                      'Lunch',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    const Spacer(),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'lib/asset/read.png',
                                        width: 30,
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
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                height: 70,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              const Color.fromARGB(127, 0, 0, 0)
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
                                    const Spacer(),
                                    const Spacer(),
                                    const Spacer(),
                                    Spacer(),
                                    const Text(
                                      'Dinner ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    const Spacer(),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'lib/asset/read.png',
                                        width: 30,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            '1 glass',
                                            style: GoogleFonts.actor(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                          const Spacer(),
                                          const Spacer(),
                                          const Spacer(),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'lib/asset/sign.png',
                                              width: 28,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'lib/asset/delete.png',
                                              width: 28.5,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Spacer(),
                                          const Spacer(),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 25,
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ));
        });
  }
}
