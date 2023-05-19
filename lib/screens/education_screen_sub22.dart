import 'package:flutter/material.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:refugees_help/screens/education_screen_sub1.dart';
import 'package:flutter/widgets.dart';
import '../controllers/EduScreenController.dart';
import 'package:get/get.dart';

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

  data( collegeName: 'كلية الحاسبات وتكنولوجيا المعلومات',
    collegeNameE: 'Faculty of Computers and Information Technology',
    collegeImg: 'assets/images/fcai.png',
    collegeURL: 'http://fcai.usc.edu.eg/',

    collegeScreen:details(dataIndex: 0),
  ),
  data( collegeName: 'كلية إدارة الأعمال',
    collegeNameE: 'Faculty of Business Administration',
    collegeImg: 'assets/images/pharmacy.jfif',
    collegeURL: '',
    collegeScreen:details(dataIndex: 1),
  ),
  data( collegeName: 'كلية الدراسات التربوية',
    collegeNameE: 'Faculty of Gradute Studies of Education',
    collegeImg: 'assets/images/vet.png',
    collegeURL: '',
    collegeScreen:details(dataIndex: 2),
  ),


];

class education_screen_sub22 extends StatelessWidget{
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EduScreenController(),
      builder: (controller) =>Scaffold(
          appBar: AppBar(
            title: Text('الكليات المتاحة في الجامعة المصرية للتعلم الإلكتروني الأهلية',
              style: TextStyle(fontSize: 15),),
            leading: BackButton(
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.grey,
            centerTitle: true,

          ),

          backgroundColor: Color(0xffEFECE7),
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
  return GetBuilder(
    init: EduScreenController(),
    builder: (controller) => SingleChildScrollView(
      child:
      Card(
        //color: Color(0xffCCC8BF),
        color: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile (

            title:  Text("${d.collegeName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
            trailing: ElevatedButton(
              child: Text('تفاصيل',style: TextStyle(fontSize: 12),),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,
                shape: StadiumBorder(),
              ),

              onPressed: () {
                //showModalBottomSheet(context: context, builder:(context)=>d.collegeScreen );
                Get.bottomSheet(d.collegeScreen);
              },
              //_navigateToNextScreen(context);
            )
        ),
      ),

    ),
  );
}
class details extends StatelessWidget {

  final int dataIndex;

  const details({super.key, required this.dataIndex});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: EduScreenController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text("تفاصيل"),
            backgroundColor: Colors.grey,
            centerTitle: true,
            toolbarHeight: 40,
          ),
          body: Container(
              margin: EdgeInsets.all(10),
              child:buildCount2(college[dataIndex], context)
          ),
      ),
    );
  }
}
Widget buildCount2(data d,BuildContext context){

  return GetBuilder(
    init: EduScreenController(),
    builder: (controller) => SingleChildScrollView(
      child: Column(
        children: [
          ListTile (
            leading: CircleAvatar(
              //  radius: 48, // Image radius
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("${d.collegeImg}"),
            ),
            title:  Text("${d.collegeName}\n ${d.collegeNameE}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
          ),
          SizedBox(height: 20,),
          SizedBox(height: 40,),

          Row(
              children:[
                IconButton(
                  onPressed: (){
                    //action coe when button is pressed
                  },
                  icon: Icon(Icons.school),
                ),
                Text("${d.collegeURL}"),

              ]
          ),
          SizedBox(height: 100,),
          Text("تواصل معنا..",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                IconButton(
                  onPressed: (){

                    //action coe when button is pressed
                  },
                  icon: Icon(Icons.phone_enabled),
                ),
                IconButton(
                  onPressed: (){
                    //action coe when button is pressed
                  },
                  icon: Icon(Icons.message),
                ),
                //Text("${d.phone}"),
              ]
          ),


        ],
      ),
    ),
  );

}
