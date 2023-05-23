import 'package:flutter/material.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:refugees_help/screens/education_screen_sub1.dart';
import 'package:flutter/widgets.dart';


class data{
  @required String? collegeName;
  @required String? collegeNameE;
  @required String? collegeImg;
  @required String collegeURL;
  Widget collegeScreen;

  data({required this.collegeName,
    required this.collegeNameE,
    this.collegeImg,
    required this.collegeURL ,
    required this.collegeScreen});
}

List<data> college=[
  data( collegeName: 'حاسبات وذكاء اصطناعي',
    collegeNameE: 'Faculty of Computers and Artificial Intelligence',
    collegeImg: 'assets/images/fcai.png',
    collegeURL: 'http://fcai.usc.edu.eg/',
    collegeScreen:details(dataIndex: 0,),
  ),
  data( collegeName: 'كلية الصيدلة',
    collegeNameE: 'Faculty of Pharmacy',
    collegeImg: 'assets/images/pharmacy.jfif',
    collegeURL: 'https://fop.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 1),
  ),
  data( collegeName: 'كلية الطب البيطري',
    collegeNameE: 'Faculty of Veterinary Medicine',
    collegeImg: 'assets/images/vet.png',
    collegeURL: 'https://vet.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 2),
  ),
  data( collegeName: 'كلية التجارة',
    collegeNameE: 'Faculty of Commerce',
    collegeImg: 'assets/images/comm.jfif',
    collegeURL: 'https://com.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 3),
  ),
  data( collegeName: 'كلية التربية',
    collegeNameE: 'Faculty of Education',
    collegeImg: 'assets/images/edus.jfif',
    collegeURL: 'https://edu.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 4),
  ),

  data( collegeName: 'كلية التربية الرياضية',
    collegeNameE: 'Faculty of Sport Education',
    collegeImg: 'assets/images/sport.jfif',
    collegeURL: 'https://phed.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 5),
  ),
  data( collegeName: 'كلية الحقوق',
    collegeNameE: 'Faculty of Law',
    collegeImg: 'assets/images/law.png',
    collegeURL: 'https://law.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 6),
  ),
  data( collegeName: 'كلية السياحة والفنادق',
    collegeNameE: 'Faculty of Tourism and Hotels',
    collegeImg: 'assets/images/tour.png',
    collegeURL: 'https://fth.usc.edu.eg/ar',
    collegeScreen:details(dataIndex: 7),
  ),
  data( collegeName: 'كلية التربية للطفولة المبكرة',
    collegeNameE: 'Faculty of Early Childhood Education',
    collegeImg: 'assets/images/educ.jfif',
    collegeURL: 'https://ech.usc.edu.eg/',
    collegeScreen:details(dataIndex: 8),
  ),
];
class education_screen_sub2 extends StatelessWidget {
  const education_screen_sub2({super.key});

  @override
  Widget build(BuildContext context) {
    return MySub2();
  }
}
class MySub2 extends StatefulWidget {
  const MySub2({super.key});

  @override
  State<MySub2> createState() => _MySub2();
}
class _MySub2 extends State<MySub2>{
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "جامعة مدينة السادات",
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
        backgroundColor: Color(0xffffffff),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context,index)=>buildCount(college[index], context),
              separatorBuilder: (context,index)=>SizedBox(height:15,)
              , itemCount: college.length),
        ),
      ),
    );
  }
}

Widget buildCount(data d,BuildContext context){

  return SingleChildScrollView(
    child:
   /* Card(
      //color: Color(0xffCCC8BF),
      color: Color(0xff3c4a50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile (

          leading: CircleAvatar(
            //  radius: 48, // Image radius
            backgroundImage: AssetImage("${d.collegeImg}"),
            backgroundColor: Colors.white,
          ),
          title:  Text("${d.collegeName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
          trailing: ElevatedButton(
            child: Text('تفاصيل',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w900),),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Color(0xffEFECE7),
              shape: StadiumBorder(),
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context, builder:
                  (context)=>d.collegeScreen);
              //getindx(d.schoolName);
            },
            //_navigateToNextScreen(context);
          )
      ),
    ),*/

    Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xffCFD8DC),
        // color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Flexible(child: Container(
            height: 140,
            child:  CircleAvatar(
              radius: 70, // Image radius
              backgroundImage: AssetImage("${d.collegeImg}"),
              backgroundColor: Colors.white,
            ),
          )),
          SizedBox(width: 5,),
          Flexible(
            // flex:1 ,
            child: Center(
              child: Column(children: [
                SizedBox(height: 25,),
                Text('${d.collegeName}',style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w900,
                    fontSize: 21
                ),),
                SizedBox(height: 30,),
                Container(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    child: Text('تفاصيل',style: TextStyle(fontSize:18,
                      color:Colors.white,
                      fontWeight: FontWeight.w900,),),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff506169),
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context, builder:
                          (context)=>d.collegeScreen);
                      //getindx(d.schoolName);
                    },
                    //_navigateToNextScreen(context);
                  ),
                ),
              ],),
            ),
          ),
        ],
      ),
    ),

  );
}

class details extends StatelessWidget {


  final int dataIndex;

  const details({super.key, required this.dataIndex});


  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),

        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xffffffff).withOpacity(0),

        body: Container(

          margin: EdgeInsets.all(10),
          child:buildCount2(college[dataIndex], context),

        ),
      ),
    );
  }
}

Widget buildCount2(data d,BuildContext context){

  return Container(

    child: Column(
      children: [

        SizedBox(height: 5,),
        Container(
            height: 5,
            width: 60,
            color: Color(0xff506169)
        ),
       SizedBox(height: 10,),

        Card(

          color: Color(0xff3c4a50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          child: Center(
            child: ListTile (
              leading: Flexible(child: Container(
                child:  CircleAvatar(
                  radius: 30, // Image radius
                  backgroundImage: AssetImage("${d.collegeImg}"),
                  backgroundColor: Colors.white,
                ),
              )),
              title:  Text("${d.collegeName}\n ${d.collegeNameE}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),),
            ),
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(height: 40,),
        Row(
            children:[
              IconButton(
                onPressed: (){
                  //action coe when button is pressed
                },
                icon: Icon(Icons.school,color: Color(0xffb93232),),
              ),
              Text("${d.collegeURL}"),

            ]
        ),
        SizedBox(height: 100,),
        Text("تواصل معنا..",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,),),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              IconButton(
                onPressed: (){

                  //action coe when button is pressed
                },
                icon: Icon(Icons.phone_enabled,color: Colors.green,size: 35,),
              ),
              IconButton(
                onPressed: (){
                  //action coe when button is pressed
                },
                icon: Icon(Icons.message, color: Colors.blue,size: 35,),
              ),
              //Text("${d.phone}"),
            ]
        ),

      ],
    ),
  );
}