// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Foods.dart/allfoods.dart';

import 'package:project/model/data_food.dart';
import 'package:project/model/data_selectedfood.dart';
import 'package:project/model/data_totalcalories.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/adapters.dart';

class BrakfastFood extends StatefulWidget {
  const BrakfastFood({super.key});

  @override
  State<BrakfastFood> createState() => _BrakfastFoodState();
}

class _BrakfastFoodState extends State<BrakfastFood> {
  late Box<Fooditem> foodbox;
  late Box<Selectedfooditem> selectedfoodbox;
  // ignore: non_constant_identifier_names
  late Box<TotalCalories> TotalCaloriesbox;

  List<Selectedfooditem> selectedItems = [];
  @override
  void initState() {
    super.initState();
    foodbox = Hive.box<Fooditem>('foodBox');
    selectedfoodbox = Hive.box<Selectedfooditem>('selectedfoodbox');

    TotalCaloriesbox = Hive.box<TotalCalories>('TotalCaloriesbox');

    //gain values
    selectedItems = selectedfoodbox.values.toList();

    checkandclear();
  }

  void checkandclear() {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (TotalCaloriesbox.containsKey(currentDate)) {
      return;
    }
    selectedItems.clear();
    updateHive(selectedItems);
    TotalCaloriesbox.put(currentDate, TotalCalories(0));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateHive(List<Selectedfooditem> items) {
    List<String> itemNames = items.map((item) => item.fooditem.name).toList();

    selectedfoodbox.keys
        .where((key) => !itemNames.contains(key.toString()))
        .toList()
        .forEach(selectedfoodbox.delete);

    selectedfoodbox.putAll(Map.fromEntries(
        items.map((item) => MapEntry(item.fooditem.name, item))));

    int totalCalories = calculatecalories();
    TotalCaloriesbox.put('totalcalories', TotalCalories(totalCalories));
  }

  void updateitemquantity(Fooditem item) {
    final index = selectedItems
        .indexWhere((selectedItem) => selectedItem.fooditem.name == item.name);
    if (index != -1) {
      selectedItems[index].quantity++;
    } else {
      selectedItems.add(Selectedfooditem(item, 1));
      updateHive(selectedItems);
    }
  }

  int calculatecalories() {
    int totalcalories = 0;
    // ignore: non_constant_identifier_names
    for (final Selectedfooditem in selectedItems) {
      totalcalories +=
          Selectedfooditem.fooditem.calories * Selectedfooditem.quantity;
    }
    return totalcalories;
  }

  //ading time for graph
  void addtodiet() {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    TotalCaloriesbox.put(currentDate, TotalCalories(calculatecalories()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Center(
                child: SizedBox(
                  height: screenHeight * 0.01,
                  width: screenWidth * 0.3,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Lottie.asset(
                      'lib/asset/Animation - fruitss.json',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Center(
                child: Text(
                  'History of selected items',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                ),
              ),

              // ignore: avoid_unnecessary_containers
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: selectedItems.length,
                            itemBuilder: (context, index) {
                              final selectedFooditem = selectedItems[index];
                              return Card(
                                elevation: 4,
                                // Customize your card widget here
                                child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedItems[index].quantity++;
                                            });
                                            updateHive(selectedItems);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Color.fromARGB(
                                                255, 38, 151, 34),
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (selectedItems[index]
                                                      .quantity >
                                                  1) {
                                                selectedItems[index].quantity--;
                                              } else {
                                                selectedItems.removeAt(index);
                                              }
                                            });
                                            updateHive(selectedItems);
                                          },
                                          icon: const Icon(
                                            Icons.minimize_rounded,
                                            color: Color.fromARGB(
                                                255, 224, 19, 19),
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedItems.removeAt(index);
                                          });
                                          updateHive(selectedItems);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color:
                                              Color.fromARGB(255, 52, 181, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    selectedFooditem.fooditem.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Calories:${selectedFooditem.fooditem.calories * selectedFooditem.quantity}Kcal',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 0, 89, 255)),
                                      ),
                                      Text(
                                        'quantity :${selectedFooditem.quantity}',
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 255, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0,
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.1,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 197, 242, 250),
                          Color.fromRGBO(225, 252, 253, 1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                addtodiet();
                              },
                              style: TextButton.styleFrom(
                                  elevation: 6,
                                  shadowColor:
                                      const Color.fromARGB(255, 119, 78, 78),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  backgroundColor:
                                      const Color.fromARGB(250, 216, 91, 87),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              child: const Text('Add to Diet'),
                            ),
                            const Spacer(),
                            const Spacer(),
                            const Spacer(),
                            TextButton(
                              onPressed: () async {
                                Fooditem? selected =
                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                  return const BreakfastfoodsList();
                                }));
                                if (selected != null) {
                                  setState(() {
                                    updateitemquantity(selected);
                                  });
                                }
                              },
                              style: TextButton.styleFrom(
                                elevation: 6,
                                shadowColor:
                                    const Color.fromARGB(255, 105, 180, 112),
                                foregroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        topLeft: Radius.circular(15))),
                                backgroundColor:
                                    const Color.fromARGB(251, 75, 167, 67),
                              ),
                              child: const Text('Add Food'),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Column(
                          children: [
                            Text(
                              "Today's Total calories :${calculatecalories()} Kcl",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromARGB(255, 255, 0, 0)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
