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

  data( collegeName: 'تكنولوجيا المعلومات',
    collegeNameE: 'Faculty of Computers and Artificial Intelligence',
    collegeImg: 'assets/images/fcai.png',
    collegeURL: 'http://fcai.usc.edu.eg/',

    collegeScreen:details(dataIndex: 0),
  ),
  data( collegeName: 'كلية إدارة الأعمال',
    collegeNameE: 'Business Administration',
    collegeImg: 'assets/images/pharmacy.jfif',
    collegeURL: '',
    collegeScreen:details(dataIndex: 1),
  ),
  data( collegeName: 'كلية الدراسات التربوية',
    collegeNameE: 'Gradute Studies of Education',
    collegeImg: 'assets/images/vet.png',
    collegeURL: '',
    collegeScreen:details(dataIndex: 2),
  ),


];
class education_screen_sub22 extends StatelessWidget {
  const education_screen_sub22({super.key});

  @override
  Widget build(BuildContext context) {
    return MySub22();
  }
}
class MySub22 extends StatefulWidget {
  const MySub22({super.key});

  @override
  State<MySub22> createState() => _MySub22();
}
class _MySub22 extends State<MySub22>{
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "الجامعة المصرية للتعلم الإلكتروني الأهلية",
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

      body:
          Container(
            margin: EdgeInsets.only(top: 80,right: 10,left: 10,bottom: 20),
          child: ListView.separated(
              itemBuilder: (context,index)=>buildCount(college[index], context),
              separatorBuilder: (context,index)=>SizedBox(height:15,)
              , itemCount: college.length),
        ),
    );
  }
}

Widget buildCount(data d,BuildContext context){
  return SingleChildScrollView(
    child:
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

    return Scaffold(

      body: Container(
          margin: EdgeInsets.all(10),
          child:buildCount2(college[dataIndex], context)
      ),
    );
  }
}
Widget buildCount2(data d,BuildContext context){

  return SingleChildScrollView(
    child: Column(
      children: [
        // ListTile (
        //   leading: CircleAvatar(
        //     //  radius: 48, // Image radius
        //     backgroundColor: Colors.white,
        //     backgroundImage: AssetImage("${d.collegeImg}"),
        //   ),
        //   title:  Text("${d.collegeName}\n ${d.collegeNameE}",
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
        // ),

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