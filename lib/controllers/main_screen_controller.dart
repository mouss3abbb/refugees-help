import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:refugees_help/screens/main_screen.dart';

class MainScreenController extends GetxController{
  var selectedPage = 1;
  bool isDropdownOpen = false;
  var cityBox = Hive.box('saved_cities');
  Set cities = {};

  var jobBox = Hive.box('saved_jobs');
  Set jobsAssets = {};
  Set jobsDescription = {};

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
    Idiom(phrase: 'عَلاولَه - تملي', explanation: 'دائما'),
    Idiom(phrase: 'شفتشي', explanation: 'ألوان زاهية'),
    Idiom(phrase: 'عفارم - براوة', explanation: 'لفظ اطراء بمعنى أحسنت'),
    Idiom(phrase: 'أونطجي', explanation: 'مخادع'),
    Idiom(phrase: 'سُك', explanation: 'أغلق'),
    Idiom(phrase: 'لُكلُك', explanation: 'ثرثرة'),
    Idiom(phrase: 'لكلاك - رغاي', explanation: 'كثير الكلام'),
    Idiom(phrase: 'لِمِض', explanation: 'كثير الجدال'),
    Idiom(phrase: 'هَجص - هَبد - فَتي - فَشر', explanation: 'تكلم بغير علم'),
    Idiom(phrase: 'ماتاخدنيش في دُوكَة', explanation: 'الهاء عن موضوع رئيسي'),
    Idiom(phrase: 'كروتة - طلسأة', explanation: 'استعجال العمل'),
    Idiom(phrase: 'فلوكَة', explanation: 'قارب صغير'),
    Idiom(phrase: 'طَنش - سِيبك', explanation: 'لا تشغل بالك'),
    Idiom(phrase: 'بقشيش', explanation: 'اكرامية'),
    Idiom(phrase: 'كل سنة وأنت طيب يا باشا', explanation: 'أين الاكرامية'),
    Idiom(phrase: 'فين الشاي - فين الحلاوة', explanation: 'كناية عن اكرامية'),
    Idiom(phrase: 'فكك مني', explanation: 'غير مستعد للحديث'),
    Idiom(phrase: 'بتاع', explanation: 'هو كل شيء تشير اليه او تتحدث عنه'),

  ];
  List<bool> isCardShown = [];


  @override
  void onInit() {
    super.onInit();
    cities.addAll(cityBox.keys);
    jobsAssets.addAll(jobBox.keys);
    jobsDescription.addAll(jobBox.values);
    for(int i = 0;i< popularIdioms.length;i++){
      isCardShown.add(false);
    }
  }

  void bookmarkSelected(){
    selectedPage = 0;
    update();
  }
  void homeSelected(){
    selectedPage = 1;
    update();
  }
  void dropDown(){
    isDropdownOpen = !isDropdownOpen;
    update();
  }
  void showCard(int index){
    isCardShown[index] = !isCardShown[index];
    update();
  }
  void removeCity(BuildContext context,int index){
    var removed = cities.toList()[index];
    cityBox.delete(removed);
    cities.remove(removed);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("تم الحذف",style: TextStyle(color: Colors.black54),),
              IconButton(onPressed: (){
                  cityBox.put(removed, '');
                  cities.add(removed);
              },
                icon: const Icon(Icons.undo,color: Colors.black54,),
                iconSize: 20,
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          dismissDirection: DismissDirection.horizontal,
        ));
    update();
  }
  void removeJob(BuildContext context, int index){
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
              const Text("تم الحذف",style: TextStyle(color: Colors.black54),),
              IconButton(onPressed: (){
                  jobBox.put(removedAsset,removedDescription);
                  jobsAssets.add(removedAsset);
                  jobsDescription.add(removedDescription);
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
    update();
  }
  List<Widget> jobPostersList(){
    List<Widget> posters = [];
    for(var i = 0; i<jobPosterAssets.length;i++){
      posters.add(JobPoster(description: jobPosterDescriptions[i], imageAsset: jobPosterAssets[i]));
    }
    return posters;
  }

}