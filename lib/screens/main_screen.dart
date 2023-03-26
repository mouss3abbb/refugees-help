import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          body: selectedPage == 1?const Home():SavedItems(),
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
                        color:Color(selectedPage == 0? 0xFFE8E5E1: 0xFF92918D),
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
                        color: Color(selectedPage == 1? 0xFFE8E5E1: 0xFF92918D),
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
          CarouselSlider(
            items: jobPostersList(),
            options: CarouselOptions(
              height: 250,
              padEnds: false,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
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

  List<Widget> jobPostersList(){
    List<Widget> posters = [];
    for(var i = 0; i<jobPosterAssets.length;i++){
      posters.add(JobPoster(description: jobPosterDescriptions[i], imageAsset: jobPosterAssets[i]));
    }
    return posters;
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
          color: Color.fromARGB(255, 94, 66, 40),
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
      onTap: () => openCity(context,name),
      onDoubleTap: () => saveCity(context,name),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(children: [
            SizedBox(
              height: 300,
              width: 340,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
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

  openCity(BuildContext context,String name) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder(),));
  }

  saveCity(BuildContext context, String name) {
    var box = Hive.box('saved_cities');
    box.put(name,'');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("تم الحفظ",style: TextStyle(color: Colors.black54),),
              IconButton(onPressed: (){
                box.delete(name);
              },
                icon: Icon(Icons.undo,color: Colors.black54,),
                  iconSize: 20,
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          dismissDirection: DismissDirection.horizontal,
        )
    );
  }
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
      onTap: () => openJob(context,description),
      onDoubleTap: () => saveJob(context,imageAsset, description),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(children: [
            SizedBox(
              height: 250,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
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

  openJob(BuildContext context,String description) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Placeholder(),));
  }

  saveJob(BuildContext context,String imageAsset, String description) {
    var box = Hive.box('saved_jobs');
    box.put(imageAsset,description);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("تم الحفظ",style: TextStyle(color: Colors.black54),),
              IconButton(onPressed: (){
                box.delete(imageAsset);
              },
                icon: Icon(Icons.undo,color: Colors.black54,),
                iconSize: 20,
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          dismissDirection: DismissDirection.horizontal,
        )
    );
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

class SavedItems extends StatefulWidget {
  const SavedItems({Key? key}) : super(key: key);

  @override
  State<SavedItems> createState() => _SavedItemsState();
}

class _SavedItemsState extends State<SavedItems> {
  var cityBox = Hive.box('saved_cities');
  Set cities = {};

  var jobBox = Hive.box('saved_jobs');
  Set jobsAssets = {};
  Set jobsDescription = {};

  @override
  Widget build(BuildContext context) {
    cities.addAll(cityBox.keys);
    jobsAssets.addAll(jobBox.keys);
    jobsDescription.addAll(jobBox.values);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0,top: 12.0),
            child: Text(
                "المدن المحفوظة",
              style: TextStyle(
                  fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) => Stack(
                  children: [
                    buildCity(cities.toList()[index]),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            var removed = cities.toList()[index];
                            cityBox.delete(removed);
                            cities.remove(removed);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("تم الحذف",style: TextStyle(color: Colors.black54),),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          cityBox.put(removed, '');
                                          cities.add(removed);
                                        });

                                      },
                                        icon: Icon(Icons.undo,color: Colors.black54,),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.white,
                                  dismissDirection: DismissDirection.horizontal,
                                )
                            );
                          });
                        },
                        icon: Icon(Icons.close,color: Colors.white,),
                      ),
                    )
                  ],
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 16.0,top: 12.0),
            child: Text(
                "الوظائف المحفوظة",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.only(bottom: 80.0),
            child: ListView.builder(
              itemCount: jobsAssets.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  JobPoster(description: jobsDescription.toList()[index], imageAsset: jobsAssets.toList()[index]),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          var removedAsset = jobsAssets.toList()[index];
                          var removedDescription = jobsDescription.toList()[index];
                          jobBox.delete(removedAsset);
                          jobsAssets.remove(removedAsset);
                          jobsDescription.remove(removedDescription);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("تم الحذف",style: TextStyle(color: Colors.black54),),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        jobBox.put(removedAsset,removedDescription);
                                        jobsAssets.add(removedAsset);
                                        jobsDescription.add(removedDescription);
                                      });

                                    },
                                      icon: Icon(Icons.undo,color: Colors.black54,),
                                      iconSize: 20,
                                    ),
                                  ],
                                ),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.white,
                                dismissDirection: DismissDirection.horizontal,
                              )
                          );
                        });
                      },
                      icon: Icon(Icons.close,color: Colors.white,),
                    ),
                  )
                ],
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  CityPoster buildCity(at) {
    String imageAsset = '';
    print(at);
    if(at =='مدينة السادات')imageAsset = 'images/sadat.jpeg';
    if(at == 'أكتوبر')imageAsset = 'images/october.jpg';
    if(at == 'القاهرة')imageAsset = 'images/cairo.jpeg';
    return CityPoster(name: at, imageAsset: imageAsset);
  }

}
