import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/resipes/Breakfastmake.dart';
import 'package:project/resipes/Breakfastview.dart';

class breakfast extends StatefulWidget {
  const breakfast({super.key});

  @override
  State<breakfast> createState() => _breakfastState();
}

class _breakfastState extends State<breakfast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Breakfast',
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
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return buildGridItem(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BreakfastMake()));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildGridItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BreakfastView()));
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 116, 129, 199),
                Color.fromARGB(255, 140, 180, 206),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

            color: Color.fromARGB(255, 214, 200, 191),
            // Replace with your desired color
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      // Replace with your image asset
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'hai',
                      style: GoogleFonts.actor(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 3,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    // Handle delete action
                    // You can add your delete logic here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
