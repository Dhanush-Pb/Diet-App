import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Your Records',
            style: GoogleFonts.actor(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 48, 109, 221),
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
                    child: Column(children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const Card(
                      color: Color.fromARGB(255, 217, 249, 255),
                      elevation: 5,
                      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: ListTile(
                        subtitle: Column(
                          children: [
                            Text('date',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'calore',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text('water',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        // Customize ListTile as needed
                      ),
                    );
                  })
            ])))));
  }
}
