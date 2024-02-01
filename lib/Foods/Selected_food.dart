// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Foods/allfoods.dart';
import 'package:project/db/db-function.dart';

import 'package:project/model/data_food.dart';
import 'package:project/model/data_model.dart';
import 'package:project/model/data_selectedfood.dart';
import 'package:project/model/data_totalcalories.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/adapters.dart';

int totalcalories12 = 0;

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
    totalcalories12 = 0;
    // ignore: non_constant_identifier_names
    for (final Selectedfooditem in selectedItems) {
      totalcalories12 +=
          Selectedfooditem.fooditem.calories * Selectedfooditem.quantity;
    }
    return totalcalories12;
  }

//ading time for graph
  void addtodiet() {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    int totalCalories = calculatecalories();
    TotalCaloriesbox.put(currentDate, TotalCalories(totalCalories));
    // Pass the total calories back to the Home1 screen
    Navigator.pop(context, totalCalories);
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ValueListenableBuilder(
        valueListenable: userlistNotifier,
        builder: (context, List<UserModel> userlis, child) {
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
                        'selected items',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 19),
                      ),
                    ),

                    // ignore: avoid_unnecessary_containers
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 25, right: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: selectedItems.isEmpty
                                    ? const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 250),
                                          child: Text(
                                              'NO selected items for this time'),
                                        ),
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: selectedItems.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 15,
                                        ),
                                        itemBuilder: (context, index) {
                                          final selectedFooditem =
                                              selectedItems[index];
                                          return Card(
                                            elevation: 4,
                                            // Customize your card widget here
                                            child: ListTile(
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        if (totalcalories12 >
                                                            userlis[0].calo) {
                                                          showDialogForExceededCalories(
                                                              context);
                                                        }
                                                        // if (totalcalories12 >
                                                        //     userlis[0].calo) {
                                                        //   ScaffoldMessenger.of(
                                                        //           context)
                                                        //       .showSnackBar(
                                                        //     const SnackBar(
                                                        //       content: Text(
                                                        //         'You have consumed more calories than your requirement!',
                                                        //         style: TextStyle(
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w600,
                                                        //             fontSize:
                                                        //                 18),
                                                        //       ),
                                                        //       behavior:
                                                        //           SnackBarBehavior
                                                        //               .floating,
                                                        //       backgroundColor:
                                                        //           Color
                                                        //               .fromARGB(
                                                        //                   255,
                                                        //                   255,
                                                        //                   0,
                                                        //                   0),
                                                        //       duration:
                                                        //           Duration(
                                                        //               seconds:
                                                        //                   2),
                                                        //     ),
                                                        //   );
                                                        //}
                                                        setState(() {
                                                          selectedItems[index]
                                                              .quantity++;
                                                        });
                                                        updateHive(
                                                            selectedItems);
                                                      },
                                                      icon: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 12),
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 26,
                                                          color: Color.fromARGB(
                                                              255, 38, 151, 34),
                                                        ),
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (selectedItems[
                                                                      index]
                                                                  .quantity >
                                                              1) {
                                                            selectedItems[index]
                                                                .quantity--;
                                                          } else {
                                                            selectedItems
                                                                .removeAt(
                                                                    index);
                                                          }
                                                        });
                                                        updateHive(
                                                            selectedItems);
                                                      },
                                                      icon: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 20),
                                                        child: Icon(
                                                          Icons
                                                              .minimize_rounded,
                                                          size: 30,
                                                          color: Color.fromARGB(
                                                              255, 224, 19, 19),
                                                        ),
                                                      )),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedItems
                                                            .removeAt(index);
                                                      });
                                                      updateHive(selectedItems);
                                                      _showsnackbar(context,
                                                          '${selectedFooditem.fooditem.name} removed!!');
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Color.fromARGB(
                                                          255, 52, 181, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              title: Text(
                                                selectedFooditem.fooditem.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    child: Text(
                                                      'Calories:${selectedFooditem.fooditem.calories * selectedFooditem.quantity}Kcal',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 0, 17, 255)),
                                                    ),
                                                  ),
                                                  Text(
                                                    'quantity :${selectedFooditem.quantity}',
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 0, 0)),
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
                                      // addtodiet();
                                    },
                                    style: TextButton.styleFrom(
                                        elevation: 6,
                                        shadowColor: const Color.fromARGB(
                                            255, 119, 78, 78),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))),
                                        backgroundColor: const Color.fromARGB(
                                            250, 216, 91, 87),
                                        foregroundColor: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    child: const Text('Add to Diet'),
                                  ),
                                  const Spacer(),
                                  const Spacer(),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () async {
                                      Fooditem? selected = await Navigator.push(
                                          context,
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
                                      shadowColor: const Color.fromARGB(
                                          255, 105, 180, 112),
                                      foregroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                              topLeft: Radius.circular(15))),
                                      backgroundColor: const Color.fromARGB(
                                          251, 75, 167, 67),
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
        });
  }

  void _showsnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        content: Text(
          message,
          style: const TextStyle(fontSize: 17),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showDialogForExceededCalories(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Calories Exceeded"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "You have consumed more calories than your requirement!",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 38, 38)),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Lottie.asset(
                        'lib/asset/Animation - 1706780429982.json',
                        width: 300,
                        height: 300),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

// Later in your code
}
