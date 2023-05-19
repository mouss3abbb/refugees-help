import 'package:flutter/material.dart';

import 'package:refugees_help/screens/education_screen_sub2.dart';
import 'package:refugees_help/screens/education_screen_sub22.dart';
import 'package:refugees_help/screens/education_screen_sub1.dart';
import '../controllers/EduScreenController.dart';
import 'package:get/get.dart';

class education_screen_sub21 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EduScreenController(),
      builder: (controller) =>Scaffold(
        appBar: AppBar(
          title: Text('الجامعات'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),

        backgroundColor: Color(0xffEFECE7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

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
              Container(
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  education_screen_sub2()),);
                     // Get.off(education_screen_sub2);
                     // Get.to(education_screen_sub2);
                    },
                    child: Text("جامعة مدينة السادات",style: TextStyle(fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),

                  )
              ),
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
              Container(
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  education_screen_sub22()),);
                    //  Get.to(education_screen_sub22);
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
