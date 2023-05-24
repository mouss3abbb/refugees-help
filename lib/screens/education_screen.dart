
import 'package:refugees_help/screens/education_screen_sub1.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:flutter/material.dart';



class education_screen extends StatelessWidget {
  const education_screen({super.key, required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return MySub1(cityName: cityName,);
  }
}
class MySub1 extends StatefulWidget {
  const MySub1({super.key, required this.cityName});
  final String cityName;
  @override
  State<MySub1> createState() => _MySub1(cityName);
}
class _MySub1 extends State<MySub1> {
  final String cityName;
  String universityImage ='';
  _MySub1(this.cityName);

  @override
  void initState() {
    super.initState();
    if(cityName == 'السادات'){
      universityImage = 'assets/images/sadat-city-university.jpg';
    }
    if(cityName == 'أكتوبر'){
      print(cityName);
      universityImage = 'assets/images/october_univ.png';
    }
    if(cityName == 'القاهرة'){
      universityImage = 'assets/images/cairo_univ.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "التعليم",
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
          backgroundColor: Color(0xffCFD8DC),
          body: SingleChildScrollView(
            child: Center(
            child: Column(
              children:[
                SizedBox(height: 20,),
                Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 300,
                        margin: EdgeInsets.all(10),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('assets/images/22.jpg',),
                        )
                    ),
                    SizedBox(height: 2,),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      height: 45,
                      width: 300,
                      //margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: Text('المدارس',style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                        ),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff506169),
                            shape: StadiumBorder(),
                            side: BorderSide(color: Color(0xff506169))
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => education_screen_sub1(cityName: cityName,)),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

      ),
             SizedBox(height: 20,),
             Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 2,),
                      Center(
                        child: Container(
                            width: 300,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                                child: Image.asset(universityImage,),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 45,
                        width: 300,
                        //margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          child: Text('الجامعات',style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white
                          ),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff506169),
                              shape: StadiumBorder(),
                              side: BorderSide(color: Color(0xff506169))
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => education_screen_sub21(cityName: cityName)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

              ),
            ],
            ),
        ),
          ),
      ),
    );
  }
}

