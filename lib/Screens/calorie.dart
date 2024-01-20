import 'package:flutter/material.dart';
import 'package:project/db/db-function.dart';
import 'package:project/home.dart';
import 'package:project/model/data_model.dart';

class Calories extends StatefulWidget {
  const Calories({Key? key}) : super(key: key);

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  void initState() {
    // TODO: implement initState
    getallUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final screenwidth = MediaQuery.of(context).size.width;
    // final Screenheight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: userlistNotifier,
        builder: (context, List<UserModel> userList, child) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                      ),
                      child: Image.asset('lib/asset/logo-search-grid-1x.png'),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Column(
                    children: [
                      const Text(
                        'Your Plan is Ready ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Daily food calorie Budget',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        userList[0].calo.toString(),
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 51.7,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 58, 176, 255),
                        width: 1,
                      ),
                      backgroundColor: const Color.fromARGB(255, 42, 170, 255),
                      minimumSize: const Size(125, 40)),
                  child: const Text('Continue'),
                ),
                const SizedBox(
                  height: 35,
                ),
                Stack(
                  children: [
                    Image.asset('lib/asset/vegetables.jpg'),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
