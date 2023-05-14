import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:refugees_help/screens/education_screen.dart';
import 'package:refugees_help/screens/job_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:ui';

class data {
  @required
  String? title;
  @required
  String? image;
  Widget screen;

  data({required this.title, this.image, required this.screen});
}

List optionPosterAssets = [
  'assets/images/teach.jpeg',
  'assets/images/jobs.jpg',
  'assets/images/doc.jpg',
  'assets/images/restaurant2.jpg',
];

List optionPosterDescriptions = [
  "التعليم",
  "فرص الشغل",
  "الخدمات الصحية",
  "المطاعم والكافيهات"
];
List optionPosterScreens = [
  education_screen(),
  job_screen(),
  "الخدمات الصحية",
  "المطاعم والكافيهات"
];

class city_screen extends StatefulWidget {
  const city_screen({super.key});

  @override
  State<city_screen> createState() => _city_screen();
}

class _city_screen extends State<city_screen> {
  var selectedPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 119, 119),
        extendBody: true,
        body: const main_city_screen(),
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
                    onPressed: () {
                      setState(() {
                        selectedPage = 0;
                      });
                    },
                    icon: Icon(
                      Icons.bookmarks_outlined,
                      size: 20,
                      color: Color(selectedPage == 0 ? 0xFFE8E5E1 : 0xFF92918D),
                    )),
                CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: Image.asset('images/pfp.jpeg', scale: 1),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedPage = 1;
                      });
                    },
                    icon: Icon(
                      Icons.home_filled,
                      size: 20,
                      color: Color(selectedPage == 1 ? 0xFFE8E5E1 : 0xFF92918D),
                    )),
              ],
            ),
          ),
        ));
  }
}

class main_city_screen extends StatelessWidget {
  const main_city_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 119, 119, 119),
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("مدينة السادات", textAlign: TextAlign.center),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 20), //apply padding to all four sides
                child: Text(
                  'اكتشف المدينة',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: Container(
                  /* decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 10,
                    ),
                  ),*/
                  margin: EdgeInsets.all(10),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 10,
                    ),
                  ),
                  child: FlutterGoogleStreetView(
                    initPos: LatLng(25.07808902, 121.5005234),
                    initSource: StreetViewSource.outdoor,
                    initBearing: 30,
                    initTilt: 30,
                    initZoom: 1.5,
                    onStreetViewCreated: (controller) async {
                      controller.animateTo(
                          duration: 50,
                          camera: StreetViewPanoramaCamera(
                              bearing: 15, tilt: 10, zoom: 3));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 20), //apply padding to all four sides
                child: Text(
                  'اعرف اكتر عن',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle the click event here
                    },
                    child: Container(
                      width: 370,
                      height: 250,
                      margin: EdgeInsets.all(5),
                      child: CarouselSlider(
                        items: optionPostersList(),
                        options: CarouselOptions(
                          height: 250,
                          padEnds: false,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> optionPostersList() {
    List<Widget> posters = [];
    for (var i = 0; i < optionPosterAssets.length; i++) {
      posters.add(optionsPoster(
          title: optionPosterDescriptions[i], image: optionPosterAssets[i]));
    }
    return posters;
  }
}

class optionsPoster extends StatelessWidget {
  const optionsPoster({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            SizedBox(
              height: 250,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),

                // gradient colors
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black54,
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(-2, 2),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  openJob(BuildContext context, String description) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Placeholder(),
        ));
  }

  saveJob(BuildContext context, String imageAsset, String description) {
    var box = Hive.box('saved_jobs');
    box.put(imageAsset, description);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "تم الحفظ",
            style: TextStyle(color: Colors.black54),
          ),
          IconButton(
            onPressed: () {
              box.delete(imageAsset);
            },
            icon: const Icon(
              Icons.undo,
              color: Colors.black54,
            ),
            iconSize: 20,
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.white,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
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
