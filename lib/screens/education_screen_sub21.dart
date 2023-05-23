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

            children: [
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 90, // Image radius
                  backgroundImage: AssetImage("assets/images/usc.jpeg"),
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 260,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const education_screen_sub2()),
                      );
                    },
                    child: Text("جامعة مدينة السادات",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18,),),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff506169),
                      shape: StadiumBorder(),
                      side: BorderSide(color: Color(0xff506169), width: 2),
                    ),

                  )
              ),
              SizedBox(height: 50),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child:
                CircleAvatar(
                  radius: 90, // Image radius
                  backgroundImage: AssetImage("assets/images/eelu.jpg"),
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
                        MaterialPageRoute(builder: (context) => const education_screen_sub22()),
                      );
                    },
                    child: Text("الجامعة المصرية للتعلم الإلكتروني الأهلية",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18,),),

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff506169),

                      shape: StadiumBorder(),
                      side: BorderSide(color: Color(0xff506169), width: 2),
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