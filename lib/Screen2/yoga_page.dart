import 'package:flutter/material.dart';

import 'package:project/Foods/style.dart';

class Yogapage extends StatefulWidget {
  const Yogapage({super.key});

  @override
  State<Yogapage> createState() => _YogapageState();
}

class _YogapageState extends State<Yogapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: styledText("Yoga Guide"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white, // Change the color of the back button here
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: styledText(
                  "Yoga is a practice that connects the body, breath, and mind. It uses physical postures, breathing exercises, and meditation to improve overall health. Yoga was developed as a spiritual practice thousands of years ago. Today, most Westerners who do yoga do it for exercise or to reduce stress.",
                  textAlign: TextAlign.center,
                  fontSize: 17,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(
              height: 30,
            ),
            _cards(imageAsset: "lib/asset/Screenshot 2024-02-10 105105.png"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                'The critical thing to remember in Warrior I is that the hips face forward. Think of your hip points as headlights—they should be roughly parallel with the front of your mat. This may require you to take a wider stance.',
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset:
                    "lib/asset/downward-dogcopy2-5991c29203f4020011a47ca9.jpg"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "The introduction of appropriate balancing postures helps build core strength. In Down Dog Split, it's not about how high you can lift your leg. Instead, focus on rooting into the hands and keeping your weight distributed evenly in both hands.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset:
                    "lib/asset/Verywell-20-4023748-Cobra02-1739-5be4c972c9e77c0026e5b68e.jpg"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "In flow yoga, Cobra is done multiple times per class as part of the vinyasa sequence of poses. While a full cobra with straight arms offers a deeper backbend, you'll build more back strength by doing low Cobras in which you lift your chest without pressing into your hands.Root into your feet, lengthen through the crown of the head, and broaden through the collarbones as you lift the sternum. It's also key to anchor your pelvis to the floor before you lift. ",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset:
                    "lib/asset/FINAL_VWFitFitnessAnnotations10-5bfefbb646e0fb002680a95f.jpg"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Little Thunderbolt Pose can be accessed from Camel Pose (above). Bringing your head to the floor results in a deep backbend and also requires very flexible quadriceps.Doing this pose before you are ready for it could cause injury to the spine. Working on different variations of Camel Pose will offer the same stretch for your quads with less intensity.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset:
                    "lib/asset/Verywell-04-3567192-Easypose-eb407e0aa56e477b9cbc9195b43a535b.webp"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Sitting cross-legged doesn't have to be a difficult position. As with Cobbler's pose, the judicious use of props can transform an uncomfortable position into one of ease so you can begin to reverse the effects of too much chair sitting.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(imageAsset: "lib/asset/images (1).jpg"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "There are many hamstrings stretches in beginning yoga for a good reason. The hamstrings tend to get short and tight in people who sit a lot, which can contribute to low back pain. Stretching them, as you do during the seated forward bend, is helpful",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset: "lib/asset/cd7bb3bb824aa14d181d383a98a00950.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "The pelvic tilt is a great way to improve your core strength and can even help reduce back pain. This simple exercise does not require any equipment.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset:
                    "lib/asset/Try Pilates Exercises to Relieve Your Back Pain and Strengthen the Core.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Pilates exercises can help decrease back pain. Learn these beginner exercises that promote core stability, and stretch and strengthen the back.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset: "lib/asset/e878764e0bb645079f3fb713f7b44191.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Learn how to do seated oblique twists with a medicine ball and try variations for standing twists. Follow our step-by-step instructions and tips.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset: "lib/asset/1bc98b225cb2673a636b2073b55bdf97.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Want to start doing yoga but don’t know how? Try these easy yoga poses with photos that anyone can easily do to release stress and be more flexible.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset:
                    "lib/asset/Try Pilates Exercises to Relieve Your Back Pain and Strengthen the Core.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Use the traditional Pilates mat exercise spine stretch forward to stretch your back and hamstrings. It also engages and trains your abdominals.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset: "lib/asset/75e4029e3f60b7a58a70ee73e09f4df6.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Learn three physical therapy stretches to improve the flexibility of the thigh muscles and keep your muscles from getting tight.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset: "lib/asset/7a9e7c13a288a6c19bd381bf7f560683.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "This fast and effective circuit workout combines ab exercises with rope jumping intervals to strengthen your core as you build endurance.",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            _cards(
                imageAsset: "lib/asset/20a877bcc32fe773a7db79d775bd3b9f.gif"),
            const SizedBox(
              height: 15,
            ),
            styledText(
                "Running injuries sideline runners daily, and iliotibial band syndrome (commonly known as IT band syndrome) is a big offender. The IT band is a connective tissue that runs down the outside of our thighs, and can cause run-stopping pain in runners when overused",
                fontSize: 15,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 15,
                  backgroundImage: AssetImage('lib/asset/yoga.png'),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 15,
                  backgroundImage: AssetImage('lib/asset/yoga (1).png'),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 15,
                  backgroundImage: AssetImage('lib/asset/yoga (2).png'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _cards({
    required String imageAsset,
  }) {
    final Size screenSize = MediaQuery.of(context).size;
    return Card(
        elevation: 40,
        color: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: screenSize.height * 0.2, // Adjust height as needed
              width: screenSize.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
