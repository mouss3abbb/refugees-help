import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refugees_help/screens/education_screen.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:refugees_help/screens/job_screen.dart';
import 'package:refugees_help/screens/Service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refugees_help/screens/profile_screen.dart';
import 'dart:ui';

import '../main.dart';
import 'RestaurantsPage.dart';
import 'main_screen.dart';
import 'dart:io';
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

List imageAssets = [];

List sadatImages = [
  'assets/images/sadat_c1.JPG',
  'assets/images/sadat_c2.JPG',
  'assets/images/sadat_c3.JPG',
  'assets/images/sadat_c4.jpg',
  'assets/images/sadat_c5.jpg',
];
List octoberImages = [
  'assets/images/oct_c1.jpg',
  'assets/images/oct_c2.jpg',
  'assets/images/oct_c3.jpg',
  'assets/images/oct_c4.jpg',
];
List cairoImages = [
  'assets/images/cairo_c1.webp',
  'assets/images/cairo_c2.jpg',
  'assets/images/cairo_c3.jpg',
  'assets/images/cairo_c4.jpg',
];
class city_screen extends StatefulWidget {
  final String name;
  const city_screen({super.key, required this.name});

  @override
  State<city_screen> createState() => _city_screen(name);
}

class _city_screen extends State<city_screen> {
  var selectedPage = 1;
  final String name;

  _city_screen(this.name);
  void initState() {
    super.initState();
    if(user['profilePhoto']==null){
      user['profilePhoto'] = 'assets/images/pfp.webp';
    }
    if(name == 'السادات'){
      imageAssets = sadatImages;
    }
    if(name == 'أكتوبر'){
      imageAssets = octoberImages;
    }
    if(name == 'القاهرة'){
      imageAssets = cairoImages;
    }
  }
  var user = Hive.box('users').get(loggedUser);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Massir'
                ),
                children: [
                  TextSpan(
                    text: "اكتشف مدينة ",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: name,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ]
            ),
          ),
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
          backgroundColor: Colors.white,
          extendBody: true,
          body: main_city_screen(name: name,),
          bottomNavigationBar: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 2),
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              // border: Border.all(
              //     color: const Color(0xff3c4a50).withOpacity(0.9), width: 3),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff3c4a50).withOpacity(0.7),
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
                        size: 30,
                        color: Color(selectedPage == 0 ? 0xFFE8E5E1 : 0xffD4D7DEFF ),
                      )),
                 GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: user['profilePhoto'] == 'assets/images/pfp.webp' ? Image.asset(user['profilePhoto'],fit: BoxFit.cover,)
                            : Image.file(File(user['profilePhoto']),fit: BoxFit.cover,),
                      ),

                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.home_filled,
                        size: 30,
                        color: Color(selectedPage == 1 ?  0xFFE8E5E1:  0xffD4D7DEFF ),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}

class main_city_screen extends StatelessWidget {
  const main_city_screen({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width-32,
            height: 450,
            child: CarouselSlider(
              items: cityImages(),
              options: CarouselOptions(
                padEnds: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration:
                const Duration(milliseconds: 600),
                autoPlayCurve: Curves.decelerate,
                enlargeCenterPage: true,
                enlargeFactor: 1,
                scrollDirection: Axis.horizontal,
                animateToClosest: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                scrollPhysics: BouncingScrollPhysics(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
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
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 370,
            height: 250,
            margin: EdgeInsets.all(5),
            child: CarouselSlider(
              items: optionPostersList(name),
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
          const SizedBox(
            height: 100,
          ),
        ],

      ),
    );
  }

  List<Widget> optionPostersList(String name) {
    List<Widget> posters = [];
    for (var i = 0; i < optionPosterAssets.length; i++) {
      posters.add(optionsPoster(
        index: i, cityName: name,));
    }
    return posters;
  }

  List<Widget> cityImages() {
    List<Widget> list = [];
    for(int i =0 ;i<imageAssets.length;i++){
      list.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageAssets[i],
                fit: BoxFit.cover,
                height: 450,
              ),
            ),
          )
      );
    }
    return list;
  }
}

class optionsPoster extends StatelessWidget {
  const optionsPoster({
    super.key,
    required this.index, required this.cityName,
  });
  final String cityName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(index){
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => education_screen(cityName: cityName)));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => job_screen(cityName: cityName)));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Service()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantsPage()));

        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            SizedBox(
              height: 250,
              child: Image.asset(
                optionPosterAssets[index],
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
                    optionPosterDescriptions[index],
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