import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import 'package:project/Foods.dart/addfood.dart';
import 'package:project/Foods.dart/searchwidget.dart';
import 'package:project/model/data_food.dart';

final searchController = TextEditingController();

class BreakfastfoodsList extends StatefulWidget {
  const BreakfastfoodsList({super.key});

  @override
  State<BreakfastfoodsList> createState() => _BreakfastfoodsListState();
}

class _BreakfastfoodsListState extends State<BreakfastfoodsList> {
  late Box<Fooditem> foodbox;
  //inital food

  List<Fooditem> fooditem = [];
  //created alist here
  List<Fooditem> filterdfooditems = [];

  // ignore: prefer_final_fields
  ValueNotifier<bool> _searchNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    //data base called here
    foodbox = Hive.box<Fooditem>('foodBox');

    _addinitialFooditems();

    fooditem = List.from(foodbox.values);
    filterdfooditems = List.from(fooditem);
  }

  void _addinitialFooditems() {
    foodbox.put(0, Fooditem(name: 'apple', calories: 52));
    foodbox.put(1, Fooditem(name: 'orange', calories: 120));
    foodbox.put(2, Fooditem(name: 'banana', calories: 100));
    foodbox.put(4, Fooditem(name: 'Brown Rice (cooked)', calories: 150));
    foodbox.put(5, Fooditem(name: 'Whole Wheat Chapati', calories: 80));
    foodbox.put(6, Fooditem(name: 'Lentil Soup', calories: 100));
    foodbox.put(7, Fooditem(name: 'Chicken Curry', calories: 200));
    foodbox.put(8, Fooditem(name: 'Paneer Tikka', calories: 250));
    foodbox.put(9, Fooditem(name: 'Aloo Gobi Curry', calories: 100));
    foodbox.put(10, Fooditem(name: 'Vegetable Samosa', calories: 300));
    foodbox.put(11, Fooditem(name: 'Chicken Biryani', calories: 400));
    foodbox.put(12, Fooditem(name: 'Masala Dosa', calories: 50));
    foodbox.put(13, Fooditem(name: 'Steamed Rice Cake', calories: 50));
    foodbox.put(14, Fooditem(name: 'Vegetable Fritters', calories: 250));
    foodbox.put(15, Fooditem(name: 'Grilled Tandoori Chicken', calories: 200));
    foodbox.put(16, Fooditem(name: 'Vegetable Biryani', calories: 300));
    foodbox.put(17, Fooditem(name: 'Butter Chicken', calories: 400));
    foodbox.put(
        18, Fooditem(name: 'Spinach and Cottage Cheese Curry', calories: 200));
    foodbox.put(19, Fooditem(name: 'Steamed Broccoli', calories: 55));
    foodbox.put(20, Fooditem(name: 'Grilled Salmon', calories: 206));
    foodbox.put(21,
        Fooditem(name: 'Quinoa Salad', calories: 120)); // Add more food items
    foodbox.put(22, Fooditem(name: 'Avocado Toast', calories: 180));
    foodbox.put(23, Fooditem(name: 'Pumpkin Soup', calories: 120));
    foodbox.put(24, Fooditem(name: 'Greek Salad', calories: 220));
    foodbox.put(25, Fooditem(name: 'Shrimp Stir Fry', calories: 280));
    foodbox.put(26, Fooditem(name: 'Mango Smoothie', calories: 150));
    foodbox.put(27, Fooditem(name: 'Chicken Caesar Salad', calories: 320));
    foodbox.put(28, Fooditem(name: 'Vegetable Stir Fry', calories: 200));
    foodbox.put(
        29,
        Fooditem(
            name: 'Blueberry Pancakes',
            calories: 350)); // Continue adding more food items
    foodbox.put(30, Fooditem(name: 'Grilled Salmon', calories: 300));
    foodbox.put(31, Fooditem(name: 'Quinoa Salad', calories: 180));
    foodbox.put(32, Fooditem(name: 'Banana Smoothie', calories: 120));
    foodbox.put(33, Fooditem(name: 'Beef Stir Fry', calories: 250));
    foodbox.put(34, Fooditem(name: 'Strawberry Waffles', calories: 220));
    foodbox.put(35, Fooditem(name: 'Caprese Salad', calories: 200));
    foodbox.put(36, Fooditem(name: 'Chocolate Milkshake', calories: 350));
    foodbox.put(37, Fooditem(name: 'Teriyaki Chicken Bowl', calories: 400));
    foodbox.put(38, Fooditem(name: 'Spinach and Feta Omelette', calories: 250));
    foodbox.put(39, Fooditem(name: 'Tomato Basil Pasta', calories: 320));
    foodbox.put(40, Fooditem(name: 'Cucumber Mint Salad', calories: 120));
    foodbox.put(
        41, Fooditem(name: 'Pineapple Coconut Smoothie', calories: 180));
    foodbox.put(42, Fooditem(name: 'Lemon Garlic Shrimp', calories: 280));
    foodbox.put(43, Fooditem(name: 'Vegetarian Burrito Bowl', calories: 320));
    foodbox.put(44, Fooditem(name: 'Raspberry Almond Smoothie', calories: 200));
    foodbox.put(45, Fooditem(name: 'Spaghetti Bolognese', calories: 400));
    foodbox.put(46, Fooditem(name: 'Chicken Caesar Wrap', calories: 280));
    foodbox.put(47, Fooditem(name: 'Broccoli Cheddar Soup', calories: 180));
    foodbox.put(48, Fooditem(name: 'Greek Gyro Wrap', calories: 350));
    foodbox.put(49, Fooditem(name: 'Mixed Berry Parfait', calories: 220));
    foodbox.put(50, Fooditem(name: 'Teriyaki Tofu Bowl', calories: 300));
    foodbox.put(51, Fooditem(name: 'Pesto Chicken Pasta', calories: 400));
    foodbox.put(52, Fooditem(name: 'Hawaiian Pizza', calories: 280));
    foodbox.put(56, Fooditem(name: 'Chicken Fajitas', calories: 300));
    foodbox.put(57, Fooditem(name: 'Raspberry Cheesecake', calories: 450));
    foodbox.put(58, Fooditem(name: 'Thai Green Curry', calories: 350));
    foodbox.put(59, Fooditem(name: 'Caramel Macchiato', calories: 200));
    foodbox.put(60, Fooditem(name: 'Caprese Pizza', calories: 320));
    foodbox.put(61, Fooditem(name: 'Teriyaki Tofu Bowl', calories: 300));
    foodbox.put(62, Fooditem(name: 'Blueberry Muffins', calories: 180));
    foodbox.put(63, Fooditem(name: 'Garlic Butter Shrimp', calories: 250));
    foodbox.put(
        64, Fooditem(name: 'Pineapple Upside Down Cake', calories: 350));
    foodbox.put(65, Fooditem(name: 'Vegetable Dumplings', calories: 220));
    foodbox.put(66, Fooditem(name: 'Strawberry Shortcake', calories: 200));
    foodbox.put(67, Fooditem(name: 'Cajun Chicken Pasta', calories: 400));
    foodbox.put(68, Fooditem(name: 'Mango Tango Smoothie', calories: 150));
    foodbox.put(69, Fooditem(name: 'Eggplant Parmesan', calories: 320));
    foodbox.put(70, Fooditem(name: 'Peppermint Mocha', calories: 250));
    foodbox.put(71, Fooditem(name: 'Vegetarian Sushi Rolls', calories: 180));
    foodbox.put(72, Fooditem(name: 'Banana Walnut Pancakes', calories: 300));
    foodbox.put(73, Fooditem(name: 'Chicken Pesto Sandwich', calories: 250));
    foodbox.put(74, Fooditem(name: 'Blueberry Lemonade', calories: 150));
    foodbox.put(75, Fooditem(name: 'Crispy Tofu Tacos', calories: 320));
    foodbox.put(76, Fooditem(name: 'Chocolate Chip Cookies', calories: 200));
    foodbox.put(77, Fooditem(name: 'Beef and Mushroom Risotto', calories: 400));
    foodbox.put(78, Fooditem(name: 'Watermelon Mint Salad', calories: 180));
    foodbox.put(
        79, Fooditem(name: 'Peanut Butter Banana Smoothie', calories: 220));
    foodbox.put(80, Fooditem(name: 'Spaghetti Carbonara', calories: 350));
    foodbox.put(
        81, Fooditem(name: 'Kale and Pineapple Smoothie', calories: 150));
    foodbox.put(82, Fooditem(name: 'Mixed Berry Salad', calories: 120));
    foodbox.put(83, Fooditem(name: 'Sweet Potato Fries', calories: 200));
    foodbox.put(84, Fooditem(name: 'Almond Butter Toast', calories: 180));
    foodbox.put(
        85, Fooditem(name: 'Quinoa Stuffed Bell Peppers', calories: 300));
    foodbox.put(86, Fooditem(name: 'Chia Seed Pudding', calories: 120));
    foodbox.put(87, Fooditem(name: 'Grilled Asparagus', calories: 80));
    foodbox.put(88, Fooditem(name: 'Avocado and Tomato Salad', calories: 220));
    foodbox.put(89, Fooditem(name: 'Green Tea Smoothie', calories: 170));
    foodbox.put(
        90, Fooditem(name: 'Baked Apples with Cinnamon', calories: 140));
    foodbox.put(91, Fooditem(name: 'Kerala Sadya', calories: 400));
    foodbox.put(92, Fooditem(name: 'Appam with Stew', calories: 320));
    foodbox.put(93, Fooditem(name: 'Kappa and Fish Curry', calories: 350));
    foodbox.put(94, Fooditem(name: 'Meen Curry (Fish Curry)', calories: 300));
    foodbox.put(95, Fooditem(name: 'Puttu with Kadala Curry', calories: 280));
    foodbox.put(
        96, Fooditem(name: 'Kerala Parotta with Chicken Curry', calories: 400));
    foodbox.put(97, Fooditem(name: 'Thalassery Biriyani', calories: 450));
    foodbox.put(98, Fooditem(name: 'Erachi Varutharacha Curry', calories: 350));
    foodbox.put(99, Fooditem(name: 'Kerala Style Prawn Roast', calories: 320));
    foodbox.put(100, Fooditem(name: 'Ada Pradhaman', calories: 200));
    foodbox.put(101, Fooditem(name: 'Aviyal with Rice', calories: 320));
    foodbox.put(102, Fooditem(name: 'Kerala Style Beef Curry', calories: 380));
    foodbox.put(103, Fooditem(name: 'Koottu Curry', calories: 250));
    foodbox.put(104, Fooditem(name: 'Nadan Kozhi Varuthathu', calories: 350));
    foodbox.put(105, Fooditem(name: 'Kerala Style Veg Pulao', calories: 280));
    foodbox.put(106, Fooditem(name: 'Chemmeen Ularthiyathu', calories: 300));
    foodbox.put(107, Fooditem(name: 'Kerala Rasam', calories: 120));
    foodbox.put(108, Fooditem(name: 'Moru Curry', calories: 150));
    foodbox.put(109, Fooditem(name: 'Kerala Sambhar', calories: 180));
    foodbox.put(110, Fooditem(name: 'Pineapple Pachadi', calories: 160));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _searchNotifier.value = !_searchNotifier.value;
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
        centerTitle: true,
        title: Text(
          'Select your Food ',
          style: GoogleFonts.actor(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 87, 182),
      ),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              coustm(
                search:
                    searchController, // Make sure you have initialized SearchController
                searchnotifier: _searchNotifier,
                onSearch: filtredfoodItems,
                searchNotifier: _searchNotifier,
                // Pass the callback function here
              ),

              // ignore: avoid_unnecessary_containers
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (filterdfooditems.isEmpty && _searchNotifier.value)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: Lottie.asset(
                                  'lib/asset/Animation - eoor.json', // Provide the path to your image asset
                                  width: 190,
                                  height: 170,
                                  // Adjust the width and height of the image as needed
                                ),
                              ),
                              const Text(
                                'No matching food items found.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filterdfooditems.length,
                          itemBuilder: (context, index) {
                            // ignore: non_constant_identifier_names
                            final FoodiTem = filterdfooditems[index];

                            return Card(
                              elevation: 4,
                              // Customize your card widget here
                              child: ListTile(
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context, FoodiTem);
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color:
                                              Color.fromARGB(255, 38, 151, 34),
                                        )),
                                  ],
                                ),
                                title: Text(
                                  FoodiTem.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Calories: ${FoodiTem.calories} Kcal',
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 6, 8, 5)),
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
              )),

              SizedBox(
                height: screenHeight * 0.0,
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.08,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            final newFoodItem = await Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const Addyfood(),
                            ));
                            if (newFoodItem != null && mounted) {
                              setState(() {
                                fooditem.add(newFoodItem);
                                filtredfoodItems("");
                                foodbox.add(newFoodItem);
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 6,
                            shadowColor: const Color.fromARGB(255, 119, 78, 78),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(248, 255, 55, 55),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Add your food'),
                        ),
                        const Spacer(),
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

  void filtredfoodItems(String query) {
    setState(() {
      filterdfooditems = fooditem
          .where((foodItem) =>
              foodItem.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
