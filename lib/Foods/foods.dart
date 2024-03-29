// ignore: file_names
import 'package:flutter/material.dart';

import 'package:project/Foods/Selected_Food.dart';

class Navcondition extends StatefulWidget {
  final String appbartitle;
  final Color appbarcolor;
  const Navcondition(
      {super.key, required this.appbartitle, required this.appbarcolor});

  @override
  State<Navcondition> createState() => _NavconditionState();
}

class _NavconditionState extends State<Navcondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: widget.appbarcolor,
          title: Text(
            widget.appbartitle,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w700),
          )),
      body: const BrakfastFood(),
    );
  }
}
