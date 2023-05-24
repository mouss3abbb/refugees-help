import 'package:flutter/material.dart';

import 'package:refugees_help/screens/education_screen_sub22.dart';


List<Widget> universityList = [];
List<Widget> sadatList = [
  University(universityName: 'جامعة مدينة السادات',imageAsset: 'assets/images/sadat-city-university.jpg'),
  SizedBox(height: 20,),
  University(universityName: 'الجامعة المصرية للتعليم الالكتروني الأهلية',imageAsset: 'assets/images/eelu.jpg'),
];
List<Widget> octoberList = [
  University(universityName: 'جامعة اكتوبر',imageAsset: 'assets/images/october_univ.png'),
];
List<Widget> cairoList = [
  University(universityName: 'جامعة القاهرة',imageAsset: 'assets/images/cairo_univ.jpg'),
];

class education_screen_sub21 extends StatelessWidget {
  const education_screen_sub21({super.key, required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget(cityName: cityName,);
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, required this.cityName});
  final String cityName;
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(cityName);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];
  final String cityName;
  _MyStatefulWidgetState(this.cityName);
  @override
  void initState() {
    super.initState();
    if(cityName == 'السادات'){
      universityList = sadatList;
    }
    if(cityName == 'أكتوبر'){
      print(cityName);
      universityList = octoberList;
    }
    if(cityName == 'القاهرة'){
      universityList = cairoList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "الجامعات",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Color( 0xffCFD8DC),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: universityList,
          ),
        ),
      ),
    );
  }
}

class University extends StatelessWidget {
  final String imageAsset,universityName;
  const University({super.key, required this.imageAsset, required this.universityName});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child:
          CircleAvatar(
            radius: 90, // Image radius
            backgroundImage: AssetImage(imageAsset),
            backgroundColor: Colors.white,
          ),),
        SizedBox(height: 10,),
        Container(
            height: 50,
            width: 260,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => education_screen_sub22(universityName: universityName,)),
                );
              },
              child: Text(universityName,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18,),),

              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Color(0xff506169),

                shape: StadiumBorder(),
                side: BorderSide(color: Color(0xff506169), width: 2),
              ),

            )
        )
      ],
    );
  }

}