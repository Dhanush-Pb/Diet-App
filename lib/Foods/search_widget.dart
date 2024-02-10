import 'package:flutter/material.dart';

Widget coustm({
  required TextEditingController search,
  required ValueNotifier<bool> searchNotifier,
  required Function(String) onSearch,
  required ValueNotifier<bool> searchnotifier,
}) {
  return ValueListenableBuilder(
    valueListenable: searchNotifier,
    builder: (context, visible, child) {
      return Visibility(
        visible: searchNotifier.value,
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 17, left: 20, right: 20),
            child: TextField(
              controller: search,
              onChanged: (value) {
                onSearch(value);
              }, //  Call the callback function here
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
                contentPadding: const EdgeInsets.all(8),
                hintText: 'Search',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
