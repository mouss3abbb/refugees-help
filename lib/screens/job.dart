import 'package:refugees_help/screens/material.dart';
import 'package:refugees_help/screens/driver.dart';
import 'package:refugees_help/screens/lawyer.dart';
import 'package:refugees_help/screens/mechanic.dart';
import 'package:refugees_help/screens/sqflite.dart';


import 'AgriculturalEng.dart';
import 'count.dart';
import 'doc.dart';
import 'eng.dart';

class data{
  @required String? jobType;
  @required String? image;
  Widget screen;
  data({this.jobType,this.image,required this.screen});
}

List<data> job=[
  data(
    jobType: 'محاسب',
    image: 'images/1.jpg',
    screen: count()
  ),
  data(
      jobType: 'مهندس مدني',
      image: 'images/2.jpg',
      screen: eng()
  ),
  data(
      jobType: 'اخصائي تغذيه',
      image: 'images/3.jpg',
      screen: doc()
  ),
  data(
      jobType: 'محامي',
      image: 'images/4.jpg',
      screen: lawyer()
  ),
  data(
      jobType: 'مهندس ميكانيكا',
      image: 'images/5.jpg',
      screen: mec()
  ),
  data(
      jobType: 'سائق',
      image: 'images/8.jpg',
      screen: driver()
  ),
  data(
      jobType: 'مهندس زراعي',
      image: 'images/9.jpg',
      screen: AgriculturalEng()
  ),
];


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFF92918D),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.sort_rounded,
                          color: Colors.white,
                          size: 35,),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.search,
                          color: Colors.white,
                          size: 35,),
                      )
                    ],
                  ),),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("فرص العمل المتاحه ", style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                  ),),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("اختر ما يناسبك", style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                  ),),
                ),

                SizedBox(height:5,),
                SingleChildScrollView(
                  child: Container(
                    height: 500,
                    margin: EdgeInsets.all(30),
                    child: ListView.builder(
                        itemBuilder: (context,index)=> buildCount(job[index],context),
                        //separatorBuilder: (context,index)=>SizedBox(height: 20,)
                         itemCount: job.length,
                    ),

                  ),
                )

              ],

            ),

          ),
        ),
      ),


    );
  }
  /*
void createDatabase() async{
    var database=await openDatabase(
     //database name
      version: 1,
      onCreate: (database,version)async{
        print('database created');
        await database.execute('create table tasks(id integer primary key,title text)');

      },
      onOpen: (database){
        print('database opened');

    },
    );
}
*/
}

Widget buildCount(data d,BuildContext context){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(
        width: 250,
        height: 400,
        decoration: BoxDecoration(
         /* boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              //blurRadius: 20,
            ),
          ],*/
          color: Color(0xFFE8E5E1),
          borderRadius: BorderRadius.circular(20.0),
        ),
         child: Column(
           children: [
             Padding(
               padding: EdgeInsets.only(top: 20),
               child: Container(
                 child: Text("${d.jobType}",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w900,
                       color: Colors.black87

                   ),),
               ),
             ),
             Container(
               width: 300,
               margin: EdgeInsets.all(10),
               child:ClipRRect(
                borderRadius: BorderRadius.circular(30),
                  child: Image.asset("${d.image}",
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
                 child: Text('التفاصيل'),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Color(0xFF2B2A2D),
                   shape: StadiumBorder(),
                   side: BorderSide(color: Colors.grey)
                 ),
                 onPressed: (){
                   showModalBottomSheet(
                     backgroundColor: Colors.transparent,
                       context: context, builder:
                   (context)=>d.screen);
                 /* Navigator.of(context).push(MaterialPageRoute(builder:
                   (context)=>d.screen));*/
                 },
               ),
             )
           ],
         ),

      ),
   );

}