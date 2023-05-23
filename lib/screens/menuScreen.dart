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

class menuScreen extends StatefulWidget {

  @override
  menuState createState()=>menuState();

}
class menuState extends State<menuScreen>{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}
Widget m(String m1,String m2,String FLink){
  return Scaffold(

    backgroundColor: Color(0xffffffff).withOpacity(0),
    body:
    SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height:10),
            Container(
                height: 5,
                width: 60,
                color: Color(0xff506169).withOpacity(0.99)
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:Color(0xffCFD8DC),
              ),
              child:
                  Container(
                //    alignment: Alignment.center,
                    //padding: const EdgeInsets.symmetric(vertical: 0),
                    child:  Text("المنيو ", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  ),

            ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Image.asset("${m1}")),
                  SizedBox(height: 30,),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset("${m2}",)),
                ],
              ),
            ),

            SizedBox(height: 20,),


            Container(
              alignment: Alignment.center,
              child: Text("للمزيد من التفاصيل زوروا\n صفحتنا على الفيسبوك",
                style: TextStyle(
                    fontSize: 40,
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
                    facebook('${FLink}') ;

                  })
              ,),
            SizedBox(height: 20,),


          ],
        ),
      ),
    ),

  );
}


