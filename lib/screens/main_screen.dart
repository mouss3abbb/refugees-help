import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refugees_help/screens/JobDescription.dart';
import 'package:refugees_help/screens/city_screen.dart';
import 'package:refugees_help/screens/job_screen.dart';
import 'package:refugees_help/screens/profile_screen.dart';

import '../controllers/main_screen_controller.dart';


class MainScreen extends StatelessWidget {

  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: MainScreenController(),
        builder: (controller) => Scaffold(
            backgroundColor: const Color.fromARGB(255, 119, 119, 119),
            extendBody: true,
            body: controller.selectedPage == 1?const Home():const SavedItems(),
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
                          controller.bookmarkSelected();
                        },
                        icon: Icon(
                          Icons.bookmarks_outlined,
                          size: 20,
                          color:Color(controller.selectedPage == 0? 0xFFE8E5E1: 0xFF92918D),
                        )),
                    GestureDetector(
                      onTap: (){
                        // Navigator.pushNamed(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                        Get.to(ProfileScreen());
                      },
                      child: CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: Image.asset('images/pfp.jpeg', scale: 1),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.homeSelected();
                        },
                        icon: Icon(
                          Icons.home_filled,
                          size: 20,
                          color: Color(controller.selectedPage == 1? 0xFFE8E5E1: 0xFF92918D),
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}



class Idiom {
  String phrase, explanation;
  Idiom({required this.phrase, required this.explanation});
}


class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder(
        init: MainScreenController(),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              items: controller.jobPostersList(),
              options: CarouselOptions(
                height: 250,
                padEnds: false,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                itemCount: controller.cityPosterAssets.length,
                itemBuilder: (context, index) => CityPoster(
                    name: controller.cityPosterNames[index],
                    imageAsset: controller.cityPosterAssets[index]),
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
                  onTap: () => controller.dropDown(),
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
                        controller.isDropdownOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            controller.isDropdownOpen
                ? Column(
                  children: [
                    IdiomCard(idiom: controller.popularIdioms[0], index: 0,),
                    IdiomCard(idiom: controller.popularIdioms[1],index: 1,),
                    IdiomCard(idiom: controller.popularIdioms[2],index: 2),
                    IdiomCard(idiom: controller.popularIdioms[3],index: 3),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const IdiomsPage(),));
                        },
                        child: const Text(
                          "المزيد",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                    ),
                  ],
                )
                : Container(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }


}


class IdiomsPage extends StatelessWidget {
  const IdiomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainScreenController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white70,
        ),
        backgroundColor: Colors.white54,
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: controller.popularIdioms.length,
              itemBuilder: (context, index) => IdiomCard(idiom: controller.popularIdioms[index],index: index,),
          ),
        ),
      ),
    );
  }
}



class IdiomCard extends StatelessWidget {


  final Idiom idiom;

  const IdiomCard({super.key, required this.idiom, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: GetBuilder(
          init: MainScreenController(),
          builder: (controller) => GestureDetector(
            onTap: () => controller.showCard(index),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      idiom.phrase,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                controller.isCardShown[index]
                    ? Text(
                        idiom.explanation,
                        style: const TextStyle(
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
     // Navigator.push(context, MaterialPageRoute(builder: (context) =>  city_screen(),));
      Get.to(city_screen());
  }

  saveCity(BuildContext context, String name) {
    var box = Hive.box('saved_cities');
    box.put(name,'');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("تم الحفظ",style: TextStyle(color: Colors.black54),),
              IconButton(onPressed: (){
                box.delete(name);
              },
                icon: const Icon(Icons.undo,color: Colors.black54,),
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
    showModalBottomSheet(context: context, builder: (context) => JobDescription(imageAsset: imageAsset, title: description, details: description, requirements: '', contact: ''),);
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


class SavedItems extends StatelessWidget{
  const SavedItems({super.key});



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder(
        init: MainScreenController(),
        builder: (controller) => Column(
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
                  itemCount: controller.cities.length,
                  itemBuilder: (context, index) => Stack(
                      children: [
                        buildCity(controller.cities.toList()[index]),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: (){
                              controller.removeCity(context, index);
                            },
                            icon: const Icon(Icons.close,color: Colors.white,),)
                          ),
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
              margin: const EdgeInsets.only(bottom: 80.0),
              child: ListView.builder(
                itemCount: controller.jobsAssets.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    JobPoster(description: controller.jobsDescription.toList()[index], imageAsset: controller.jobsAssets.toList()[index]),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: (){
                          controller.removeJob(context, index);
                        },
                        icon: const Icon(Icons.close,color: Colors.white,),
                      ),
                    )
                  ],
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
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
