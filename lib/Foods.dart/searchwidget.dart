import 'package:flutter/material.dart';

Widget coustm({
  required TextEditingController search,
  required ValueNotifier searchnotifier,
  // ignore: non_constant_identifier_names
}) {
  return ValueListenableBuilder(
      valueListenable: searchnotifier,
      builder: (context, visible, child) {
        return Visibility(
            visible: searchnotifier.value,
            // ignore: avoid_unnecessary_containers
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(17),
              child: TextFormField(
                controller: search,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.6),
                    contentPadding: const EdgeInsets.all(8.0),
                    hintText: 'search',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            )));
      });
}
