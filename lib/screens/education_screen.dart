
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
    return  Scaffold(
          backgroundColor: Colors.brown.shade50,
          appBar: AppBar(
            title: Text('التعليم'),
            backgroundColor: Colors.grey,
            centerTitle: true,
            leading: BackButton(
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          body:
          SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(50),
                  ),
                  // image1
                  Container(

                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 10,
                        color: Colors.grey,),
                      borderRadius: BorderRadius.circular(20),
                      //<-- SEE HERE
                    ),
                    child: Image.asset('assets/images/22.jpg'),
                  ),
                  //button1
                  Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: Text('المدارس',style: TextStyle(fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.grey, width: 2),
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
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 10,
                        color: Colors.grey,),
                      borderRadius: BorderRadius.circular(20),
                      //<-- SEE HERE
                    ),
                    child: Image.asset('assets/images/sadat-city-university.jpg'),
                  ),
                  //button2
                  Container(

                margin: EdgeInsets.all(10),
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const education_screen_sub21()),
                    );
                  },
                  child: Text('الجامعات',style: TextStyle(fontWeight: FontWeight.bold),),

                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,

                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.grey, width: 2),
                  ),

                )
              ),
            ]
            )),
          )
    );
  }
}


