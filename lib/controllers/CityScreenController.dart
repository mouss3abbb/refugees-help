import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:refugees_help/screens/city_screen.dart';
import 'package:refugees_help/screens/job_screen.dart';
import 'package:refugees_help/screens/education_screen.dart';
class CityScreenController extends GetxController{
  var selectedPage = 1;
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
  void bookmarkSelected(){
    selectedPage = 1;
    update();
  }
  void homeSelected(){
    selectedPage = 0;
    update();
  }
  List<Widget> optionPostersList() {
    List<Widget> posters = [];
    for (var i = 0; i < optionPosterAssets.length; i++) {
      posters.add(optionsPoster(
        index: i,));
    }
    return posters;
  }

}