import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

facebook(String u) async{
  if(await canLaunch(u)){
    await launch(u);
  }else{
    throw "Could not launch $u";
  }
}

class menuScreen extends StatefulWidget{
  @override
  menuState createState()=>menuState();

}
class menuState extends State<menuScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE8E5E1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text("المنيو",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Image.asset('images/1.png',)),
                    SizedBox(height: 30,),
                    Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        child: Image.asset('images/1.png',)),
                  ],
                ),
              ),

              SizedBox(height: 20,),


              Container(
                alignment: Alignment.center,
                child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                  style: TextStyle(
                      fontSize: 5,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: IconButton(
                    icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                    onPressed: (){})
                ,),


            ],
          ),
        ),
      ),

    );
  }

}
Widget taiba(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/taiba/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/taiba/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/restaurant.taiba?mibextid=ZbWKwL") ;

                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget dajaj(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/dajaj/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/dajaj/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/djaj.fc.resturant?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget heartAttack(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/heartAttack/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/heartAttack/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/profile.php?id=100089372753455&mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget shamy(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/shamy/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/shamy/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/profile.php?id=100064861143564&mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget aboAlsoud(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/aboAlsoud/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/aboAlsoud/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/Abo.AlS3oud1985?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget ketchup(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/ketchup/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/ketchup/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/ketshup.sadatcity?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget fatatry(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/fatatry/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/fatatry/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/profile.php?id=100086228151439&mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget hamza(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/hamza/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/hamza/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/profile.php?id=100076055174332&mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget robaia(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/robaia/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/robaia/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/4ShoppingCafe?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget qasrALemaratiya(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/qasrALemaratiya/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/qasrALemaratiya/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/Qasralemaratiya?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget alnadyAlmalaky(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/alnadyAlmalaky/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/alnadyAlmalaky/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/RoyalClubSC?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}
Widget tiger(){
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text("المنيو",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('images/tiger/menu1.jpg',)),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset('images/tiger/menu2.jpg',)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.facebook,color: Colors.blue,size: 50,),
                  onPressed: (){
                    facebook("https://www.facebook.com/elnemr2017/?mibextid=ZbWKwL");
                  })
              ,),


          ],
        ),
      ),
    ),

  );
}

