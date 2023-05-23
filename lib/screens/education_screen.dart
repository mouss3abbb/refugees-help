
import 'package:refugees_help/screens/education_screen_sub1.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:flutter/material.dart';



class education_screen extends StatelessWidget {
  const education_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MySub1();
  }
}
class MySub1 extends StatefulWidget {
  MySub1({super.key});

  @override
  State<MySub1> createState() => _MySub1();
}
class _MySub1 extends State<MySub1> {
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
          body:
        /*  SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[


                  SizedBox(height: 40,),
                  Text("التعليم",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,

                  ),),
                  Container(
                    margin: EdgeInsets.all(20),
                  ),
                  // image1
                  Container(

                    height: 200,
                    width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5,
                          color: Color(0xff3c4a50).withOpacity(0.7),),
                        borderRadius: BorderRadius.circular(30),
                        //<-- SEE HERE
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/22.jpg',
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                  //button1
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      height: 45,
                      width: 200,
                      child: ElevatedButton(
                        child: Text('المدارس',style: TextStyle(fontWeight: FontWeight.bold),),

                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff3c4a50),
                          shape: StadiumBorder(),
                          side: BorderSide(color: Color(0xff3c4a50), width: 2),

                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const education_screen_sub1()),
                          );
                        },

                        //_navigateToNextScreen(context);

                      )
                  ),
                  // image2
                  SizedBox(height: 30,),
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5,
                        color: Color(0xff3c4a50).withOpacity(0.7),),
                      borderRadius: BorderRadius.circular(30),
                      //<-- SEE HERE
                    ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/sadat-city-university.jpg',
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                  //button2
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      height: 45,
                      width: 200,
                      child: ElevatedButton(

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const education_screen_sub21()),
                          );
                        },
                        child: Text('الجامعات',style: TextStyle(fontWeight: FontWeight.bold),),

                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff3c4a50),
                          shape: StadiumBorder(),
                          side: BorderSide(color: Color(0xff3c4a50), width: 2),

                        ),

                      )
                  ),
                ]
                )),
          ),*/
        Center(
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
                        child: Image.asset('assets/images/22.jpg',
                        ),
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
                          MaterialPageRoute(builder: (context) => const education_screen_sub1()),
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
                              child: Image.asset('assets/images/sadat-city-university.jpg',),
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
                            MaterialPageRoute(builder: (context) => const education_screen_sub21()),
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
    );
  }
}

