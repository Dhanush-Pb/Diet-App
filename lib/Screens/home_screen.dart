import 'package:flutter/material.dart';
import 'package:project/Screens/Record_screen.dart';
import 'package:project/Screens/account_screen.dart';
import 'package:project/Screens/home_screen1.dart';
import 'package:project/resipes/resipes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home1(),
    Record(),
    Resipes(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(187, 246, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          child: DefaultTextStyle(
            style: const TextStyle(fontWeight: FontWeight.bold),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'lib/asset/button.png',
                    width: 27,
                  ),
                  label: "Home",
                  backgroundColor: const Color.fromRGBO(186, 238, 247, 1),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'lib/asset/bullet.png',
                    width: 26,
                  ),
                  label: 'Record',
                  backgroundColor: const Color.fromRGBO(186, 238, 247, 1),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'lib/asset/cook-book.png',
                    width: 27,
                  ),
                  label: 'Recipes',
                  backgroundColor: const Color.fromRGBO(186, 238, 247, 1),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'lib/asset/user.png',
                    width: 28,
                  ),
                  label: 'Profile',
                  backgroundColor: const Color.fromRGBO(186, 238, 247, 1),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color.fromARGB(255, 0, 60, 255),
              unselectedItemColor: const Color.fromARGB(255, 137, 33, 255),
              onTap: _onItemTapped,
              selectedFontSize: 14.5,
              unselectedFontSize: 10.5,
            ),
          ),
        ),
      ),
    );
  }
}
