import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPage = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 119, 119, 119),
          extendBody: true,
          body: const Home(),
          bottomNavigationBar: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 2),
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              border: Border.all(
                  color: const Color(0xff171817).withOpacity(0.05), width: 3),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff171817).withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: BlurEffect(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmarks_outlined,
                        size: 20,
                        color: Color(0xFF92918D),
                      )),
                  CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: Image.asset('images/pfp.jpeg', scale: 1),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home_filled,
                        size: 20,
                        color: Color(0xFFE8E5E1),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}

List jobPosterAssets = [
  'images/poster1.png',
  'images/poster2.png',
  'images/poster3.png',
];

List jobPosterDescriptions = [
  "بمرتب 4000\nمندوب مبيعات في أكتوبر",
  "محاسب بدون خبرة في السادات\nمرتب 3000 ومتوفر سكن",
  "مطلوب مضيفات طيران\nشركةFly Emirates"
];

List cityPosterAssets = [
  'images/sadat.jpeg',
  'images/october.jpg',
  'images/cairo.jpeg',
];
List cityPosterNames = [
  'مدينة السادات',
  'أكتوبر',
  'القاهرة',
];

List popularIdioms = [
  Idiom(phrase: 'Example', explanation: 'Explanation'),
  Idiom(phrase: 'Example', explanation: 'Explanation'),
  Idiom(phrase: 'Example', explanation: 'Explanation'),
  Idiom(phrase: 'Example', explanation: 'Explanation'),
  Idiom(phrase: 'Example', explanation: 'Explanation'),
];

class Idiom {
  var phrase, explanation;
  Idiom({this.phrase, this.explanation});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobPosterAssets.length,
                itemBuilder: (context, index) => JobPoster(
                  imageAsset: jobPosterAssets[index],
                  description: jobPosterDescriptions[index],
                ),
              )),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cityPosterAssets.length,
              itemBuilder: (context, index) => CityPoster(
                  name: cityPosterNames[index],
                  imageAsset: cityPosterAssets[index]),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Color(0xff171817),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: GestureDetector(
                onTap: () => setState(() {
                  isDropdownOpen = !isDropdownOpen;
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'عبارات مشهورة',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      isDropdownOpen
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          isDropdownOpen
              ? SizedBox(
                  height: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: popularIdioms.length,
                    itemBuilder: (context, index) =>
                        IdiomCard(idiom: popularIdioms[index]),
                  ),
                )
              : Container(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class IdiomCard extends StatefulWidget {
  const IdiomCard({super.key, required this.idiom});
  final Idiom idiom;
  @override
  State<IdiomCard> createState() => _IdiomCardState(idiom);
}

class _IdiomCardState extends State<IdiomCard> {
  bool isCardShown = false;

  final Idiom idiom;

  _IdiomCardState(
    this.idiom,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 61, 43, 26),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: GestureDetector(
          onTap: () => setState(() {
            isCardShown = !isCardShown;
          }),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    idiom.phrase,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              isCardShown
                  ? Text(
                      idiom.explanation,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class CityPoster extends StatelessWidget {
  const CityPoster({
    super.key,
    required this.name,
    required this.imageAsset,
  });

  final String name;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openCity(name),
      onDoubleTap: () => saveCity(name),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(children: [
            Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              width: 350,
              height: 300,
            ),
            Container(
              width: 350,
              height: 300,
              color: const Color.fromARGB(86, 22, 22, 22),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 12,
                        offset: Offset(-2, 2),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  openCity(String name) {}

  saveCity(String name) {}
}

class JobPoster extends StatelessWidget {
  const JobPoster({
    super.key,
    required this.description,
    required this.imageAsset,
  });

  final String description;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openJob(description),
      onDoubleTap: () => saveJob(imageAsset, description),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(children: [
            Image.asset(
              imageAsset,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 12,
                          offset: Offset(-2, 2),
                        )
                      ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  openJob(String description) {}

  saveJob(String imageAsset, String description) {}
}

class BlurEffect extends StatelessWidget {
  const BlurEffect({super.key, this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(2),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
