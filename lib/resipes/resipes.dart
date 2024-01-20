import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/resipes/breakfast.dart';
import 'package:project/resipes/dinner.dart';
import 'package:project/resipes/lunch.dart';

class Resipes extends StatefulWidget {
  const Resipes({super.key});

  @override
  State<Resipes> createState() => _ResipesState();
}

class _ResipesState extends State<Resipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Recipes',
          style: GoogleFonts.actor(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(255, 120, 184, 196),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                _buildCard(
                    imageAsset: ('lib/asset/Screenshot 2024-01-18 170031.png'),
                    buttonText: ('Add your Break Fast Recipes'),
                    navigateTo: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const breakfast()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                _buildCard(
                    imageAsset: ('lib/asset/Screenshot 2024-01-18 174329.png'),
                    buttonText: ('Add your Lunch Recipes'),
                    navigateTo: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Lunch()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                _buildCard(
                    imageAsset: ('lib/asset/Screenshot 2024-01-18 180421.png'),
                    buttonText: ('Add your Dinner Recipes'),
                    navigateTo: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Dinner()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imageAsset,
    required String buttonText,
    required VoidCallback navigateTo,
  }) {
    return Card(
      elevation: 40,
      color: Colors.black38,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 210,
            width: 330,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: navigateTo,
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(146, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: TextButton(
                onPressed: navigateTo,
                child: Text(
                  buttonText,
                  style: GoogleFonts.actor(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
