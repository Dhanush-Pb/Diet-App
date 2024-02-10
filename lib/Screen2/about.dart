import 'package:flutter/material.dart';
import 'package:project/Foods/style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white, // Change the color of the back button here
        ),
      ),
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            styledText(
              'About Our Diet App',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            styledText(
              'Welcome to Nutri Fuel - your personalized diet companion!',
              fontSize: 18,
            ),
            const SizedBox(height: 10),
            styledText(
              'Nutrie Fuel is designed to help you achieve your health and fitness goals by providing personalized diet plans, nutritional information, and tracking tools.',
              fontSize: 16,
            ),
            const SizedBox(height: 10),
            styledText(
              'Our Features Include:',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            styledText(
              '- Personalized Diet Plans: Tailored to your specific needs and goals.',
              fontSize: 16,
            ),
            styledText(
              '- Food Tracking: Easily log your meals and track your daily intake.',
              fontSize: 16,
            ),
            styledText(
              '- Nutritional Information: Access detailed nutritional data for thousands of foods.',
              fontSize: 16,
            ),
            styledText(
              '- Recipe Suggestions: Discover delicious and healthy recipes to try.',
              fontSize: 16,
            ),
            const SizedBox(height: 20),
            styledText(
              'We are committed to helping you live a healthier lifestyle!',
              fontSize: 18,
            ),
            const SizedBox(height: 10),
            styledText(
              'For any questions or feedback, please contact us at:',
              fontSize: 16,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                // Add your contact action here
              },
              child: styledText(
                'info@NutrieFuel.com',
                fontSize: 16,
                color: Colors.blue, // Make it look like a link
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
