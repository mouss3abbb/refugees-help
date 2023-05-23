import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refugees_help/screens/menuScreen.dart';

//import '../../Users/H.WIN-10/Downloads/refugees-help-master/lib/screens/menuScreen.dart';
class RestaurantsPage extends StatefulWidget{
  @override
  RestaurantsState createState()=>RestaurantsState();
}
class RestaurantsState extends State<RestaurantsPage>{
  Widget R(RData d,BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),

              child:
              Container(
                child:CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('${d.image}'),
                ),
              ),
            ),
            Container(
              child: Text("${d.name}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                ),
              ),
            ),
            Container(
              child: Text("${d.place}",
                style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w900,
                    color: Colors.black,
                ),
              ),
            ),

            Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                height: 20,
                width: 30,
                //margin: EdgeInsets.all(10),
                child: IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.restaurant_menu,color: Color(0xff506169),size: 30,),//Text("المنيو",style: TextStyle(fontSize: 20,color: Colors.black)),
                    onPressed: (){showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context, builder:
                        (context)=>d.screen);})

            ),
          ],
        ),
      ),
    );

  }
  Widget C(CData d,BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          /* boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              //blurRadius: 20,
            ),
          ],*/
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child:
              Container(
                child:CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('${d.image2}'),
                ),
              ),
            ),
            Container(
              child: Text("${d.name2}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                ),
              ),
            ),
            Container(
              child: Text("${d.place2}",
                style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w900,
                    color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 2,),
            Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                height: 20,
                width: 30,
                //margin: EdgeInsets.all(10),
                child: IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.menu_book,color: Color(0xff506169),size: 30,),//Text("المنيو",style: TextStyle(fontSize: 20,color: Colors.black)),
                    onPressed: (){showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context, builder:
                        (context)=>d.screen2);})

            ),
          ],
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffCFD8DC),
              elevation: 0,
              title: Text(
                "المطاعم والكافيهات",
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
            body:SingleChildScrollView(
              child: Container(
                height: 900,
                color: Color(0xffCFD8DC),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 20),
                      child: Text(" المطاعم",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 300,
                        //margin: EdgeInsets.all(30),
                        child: ListView.builder(
                          itemBuilder: (context,index)=> R(Restaurants[index],context),
                          //separatorBuilder: (context,index)=>SizedBox(height: 20,)
                          itemCount: Restaurants.length,
                          scrollDirection: Axis.horizontal,
                        ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(" الكافيهات",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 300,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemBuilder: (context,index)=> C(Cafes[index],context),
                          //separatorBuilder: (context,index)=>SizedBox(height: 20,)
                          itemCount: Cafes.length,
                          scrollDirection: Axis.horizontal,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            )

        ),
      ),
    );
  }

}
class RData{
  @required String image;
  @required String name;
  @required String place;
  Widget screen;
  RData({required this.image,required this.name,required this.place,required this.screen});
}
class CData{
  @required String image2;
  @required String name2;
  @required String place2;
  Widget screen2;
  CData({required this.image2,required this.name2,required this.place2,required this.screen2});

}
List<RData> Restaurants=[
  RData(image: 'images/taiba/taiba.jpg', name: " طيبه", place: "المنطقه الثالثه",screen: m('images/taiba/menu1.jpg','images/taiba/menu2.jpg',"https://www.facebook.com/restaurant.taiba?mibextid=ZbWKwL")),
  RData(image: 'images/dajaj/dajaj.jpg', name: " دجاج", place: "المنطقه الحادية عشر",screen: m('images/dajaj/menu1.jpg','images/dajaj/menu2.jpg',"https://www.facebook.com/djaj.fc.resturant?mibextid=ZbWKwL")),
  RData(image: 'images/heartAttack/heartAttack.jpg', name: " هارت اتاك", place: "المنطقه الخامسه",screen: m('images/heartAttack/menu1.jpg','images/heartAttack/menu2.jpg',"https://www.facebook.com/profile.php?id=100089372753455&mibextid=ZbWKwL")),
  RData(image: 'images/shamy/shamy.jpg', name: " الشامي", place: "المنطقه الاولى",screen: m('images/shamy/menu1.jpg','images/shamy/menu2.jpg',"https://www.facebook.com/profile.php?id=100064861143564&mibextid=ZbWKwL")),
  RData(image: 'images/aboAlsoud/aboAlsoud.jpg', name: " ابو السعود", place: "المنطقه السابعه",screen: m('images/aboAlsoud/menu1.jpg','images/aboAlsoud/menu2.jpg',"https://www.facebook.com/Abo.AlS3oud1985?mibextid=ZbWKwL")),
  RData(image: 'images/ketchup/ketchup.jpg', name: " كاتشب", place: "المنطقه الثانيه",screen: m('images/ketchup/menu1.jpg','images/ketchup/menu2.jpg',"https://www.facebook.com/ketshup.sadatcity?mibextid=ZbWKwL")),
  RData(image: 'images/fatatry/fatatry.jpg', name: " فطاطري المدينه", place: "المنطقه السابعه",screen: m('images/fatatry/menu1.jpg','images/fatatry/menu2.jpg',"https://www.facebook.com/profile.php?id=100086228151439&mibextid=ZbWKwL")),
];
List<CData> Cafes=[
  CData(image2: 'images/hamza/hamza.jpg', name2: "حمزة", place2: "مجمع المطاعم",screen2: m('images/hamza/menu1.jpg','images/hamza/menu2.jpg',"https://www.facebook.com/profile.php?id=100076055174332&mibextid=ZbWKwL")),
  CData(image2: 'images/robaia/robaia.jpg', name2: "الرباعيه", place2: "المنطقه الحادية عشر",screen2: m('images/robaia/menu1.jpg','images/robaia/menu2.jpg',"https://www.facebook.com/4ShoppingCafe?mibextid=ZbWKwL")),
  CData(image2: 'images/qasrALemaratiya/qasrALemaratiya.jpg', name2: "قصر الاماراتيه", place2: "المنطقه الثالثه",screen2: m('images/qasrALemaratiya/menu1.jpg','images/qasrALemaratiya/menu2.jpg',"https://www.facebook.com/Qasralemaratiya?mibextid=ZbWKwL")),
  CData(image2: 'images/alnadyAlmalaky/alnadyAlmalaky.jpg', name2: "النادي الملكي", place2: "المنطقه السابعه",screen2: m('images/alnadyAlmalaky/menu1.jpg','images/alnadyAlmalaky/menu2.jpg',"https://www.facebook.com/RoyalClubSC?mibextid=ZbWKwL")),
  CData(image2: 'images/tiger/tiger.jpg', name2: "تايجر", place2: "مجمع المطاعم",screen2: m('images/tiger/menu1.jpg','images/tiger/menu2.jpg',"https://www.facebook.com/elnemr2017/?mibextid=ZbWKwL")),

];