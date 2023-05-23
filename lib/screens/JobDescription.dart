import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:refugees_help/screens/job_screen.dart';
import 'package:refugees_help/screens/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class JobDescription extends StatefulWidget {
  const JobDescription({Key? key, required this.imageAsset, required this.title,required this.details, required this.requirements, required this.contact}) : super(key: key);
  final String imageAsset,details,requirements,contact,title;
  @override
  State<JobDescription> createState() => _JobDescriptionState(
    imageAsset: imageAsset,
    title: title,
    contact: contact,
    details: details,
    requirements: requirements
  );
}

class _JobDescriptionState extends State<JobDescription> {
  late var isMark;
  final String imageAsset,details,requirements,contact,title;
  _JobDescriptionState({required this.imageAsset,required this.title, required this.details, required this.requirements, required this.contact});
  @override
  void initState() {
    super.initState();
    isMark = Hive.box('saved_jobs').containsKey(imageAsset);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),

        ),
      ),
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5,
              width: 60,
                color: Color(0xff506169).withOpacity(0.99)
            ),
            const SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 250,
                            width: 250,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffCFD8DC)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(imageAsset,
                                fit: BoxFit.cover,
                              ),
                            )
                        ),
                        const SizedBox(width: 10,),
                        IconButton(
                            onPressed: (){
                          setState(() {
                            if(isMark){
                              Hive.box('saved_jobs').delete(imageAsset);
                            }else {
                              saveJob(context, imageAsset, title);
                            }
                            isMark = !isMark;
                          });
                        }, icon: Icon(
                            Icons.bookmark,
                            size: 30,
                            color: Color(isMark?  0xff506169:  0xff9cb5bc ),

                        )),

                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Color(0xffCFD8DC),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child:  Text("تفاصيل الشغل", style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(.0),
              child: Row(

                children: [
                  Text(details, style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                  ),),
                  const SizedBox(width: 10,),

                ],
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:Color(0xffCFD8DC),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child:  Text("المتطلبات", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(.0),
              child: Row(
                children: [
                  Text(requirements, style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  ),)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:Color(0xffCFD8DC),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child:  Text("تواصل معنا", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
             // margin: EdgeInsets.symmetric(vertical: 25),
              height: 45,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 0,
                    primary: Theme
                        .of(context)
                        .primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: () {
                  whatsapp();
                },
                child: const Icon(FontAwesomeIcons.whatsapp,size: 40,)
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              height: 45,
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      elevation: 0,
                      primary: Theme
                          .of(context)
                          .primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  onPressed: () {
                    email();
                  },
                  child: const Icon(FontAwesomeIcons.envelope,size: 40,)
                /*Text('Apply Now', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),),*/
                //envelope
              ),
            ),
          ],
        ),
      ),
    );
  }



  calling()async{
    const url= 'tel:+201025027368';
    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not lanch $url';
    }
  }

  whatsapp() async {
    await launch('https://wa.me/+201025027368?text=hello');
  }

  email(){
    launch('mailto:rahmaKh871@gmail.com?subject=TestEmail&body=I am typing this test email%20plugin');

  }

  urlLaunch() async{
    const url='https://www.facebook.com/profile.php?id=100045898622314';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not launch $url";
    }
  }
}