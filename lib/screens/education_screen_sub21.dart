import 'package:flutter/material.dart';

import 'package:refugees_help/screens/education_screen_sub2.dart';
import 'package:refugees_help/screens/education_screen_sub22.dart';
import 'package:refugees_help/screens/education_screen_sub1.dart';


class education_screen_sub21 extends StatelessWidget {
  const education_screen_sub21({super.key});

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFECE7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("التعليم",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,

              ),),
              SizedBox(height: 40,),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 8.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 90, // Image radius
                  backgroundImage: AssetImage("assets/images/usc.jpeg"),
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 260,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const education_screen_sub2()),
                      );
                    },
                    child: Text("جامعة مدينة السادات",style: TextStyle(fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),

                  )
              ),
              SizedBox(height: 50),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 8.0,
                  ),
                ),
                child:
                CircleAvatar(
                  radius: 90, // Image radius
                  backgroundImage: AssetImage("assets/images/eelu.jpg"),
                  backgroundColor: Colors.white,
                ),),
              SizedBox(height: 10,),
              Container(
                width: 260,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const education_screen_sub22()),
                      );
                    },
                    child: Text("الجامعة المصرية للتعلم الإلكتروني الأهلية",
                      style: TextStyle(fontWeight: FontWeight.bold),),

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,

                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),

                  )
              ),



            ],
          ),
        ),
      ),
    );
  }
}