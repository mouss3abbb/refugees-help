import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'JobDescription.dart';

class data{
  @required String? jobType;
  @required String? image;
  Widget screen;
  data({this.jobType,this.image,required this.screen});
}

List jobsList=[
  JobDescription(imageAsset: 'images/1.jpg', title: 'محاسب', details: '''
    مواعيد العمل من 7 صباحا الي 5 مساءا
    المرتب 5 الاف جنيه شهريا
  ''', requirements: '''
    يحافظ على الضوابط المحاسبية
    وضع وتنفيذ وتوثيق نظم حفظ السجلات والمحاسبة
    2 - 10 سنوات خبرة
    مؤهل عالي
  ''', contact: ''),
  JobDescription(imageAsset: 'images/3.jpg', title: 'أخصائي تغذية', details: '''
    دوام كامل
    المرتب 10 الاف جنيه شهريا
  ''', requirements: '''
  على علم بالثقافات الغذائية
  يجيد خدمة العملاء بطريقة حسنة
  ذو مهارات ادارية وتنظيمية
  يجيد التعامل مع مشاكل المرضى بصورة جيدة
  ''', contact: ''),
  JobDescription(imageAsset: 'images/2.jpg', title: 'مهندس مدني', details: '''
    دوام كامل
    المرتب 15 الف جنيه شهريا
  ''', requirements: '''
    العمل في التنفيذ بمجال المقاولات
    عدد سنوات خبرة في نفس المجال المطلوب
    يجب ارفاق سابقة خبرة تؤكد العمل السابق
  ''', contact: ''),
  JobDescription(imageAsset: 'images/4.jpg', title: 'محامي', details: '''
    العمل من 9 صباحا الى 5 مساءا
    المرتب 5 الاف جنيه شهريا
  ''', requirements: '''
    مؤهل عالي
    خبرة لا تقل عن 3 سنوات
  ''', contact: ''),
  JobDescription(imageAsset: 'images/5.jpg', title: 'مهندس ميكانيكا', details: '''
    دوام كامل
    المرتب حسب الخبرة الهندسية
  ''', requirements: '''
    خبرة لا تقل عن سنتين
    حاصل على شهادة بكاليريوس
  ''', contact: ''),
];

saveJob(BuildContext context,String imageAsset, String description) {
  var box = Hive.box('saved_jobs');
  box.put(imageAsset,description);
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("تم الحفظ",style: TextStyle(color: Colors.black54),),
            IconButton(onPressed: (){
              box.delete(imageAsset);
            },
              icon: const Icon(Icons.undo,color: Colors.black54,),
              iconSize: 20,
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white,
        dismissDirection: DismissDirection.horizontal,
      )
  );
}

class job_screen extends StatelessWidget {
  const job_screen({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF36454C),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("فرص العمل المتاحه ", style: TextStyle(
                    color: Colors.white,
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
                    height: 600,
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: ListView.builder(
                      itemBuilder: (context,index)=> buildCount(context,index),
                      //separatorBuilder: (context,index)=>SizedBox(height: 20,)
                      itemCount: jobsList.length,
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

}

Widget buildCount(BuildContext context, int index){
  JobDescription data = jobsList[index];
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: 250,
      height: 400,
      decoration: BoxDecoration(
        color: Color(0xFFE8E5E1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              child: Text(data.title,
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
                child: Image.asset(data.imageAsset,
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
              child: Text('التفاصيل',style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black54
              ),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff9cb5bc),
                  shape: StadiumBorder(),
                  side: BorderSide(color: Color(0xff9cb5bc))
              ),
              onPressed: (){
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, builder:
                    (context)=>data);
              },
            ),
          )
        ],
      ),

    ),
  );

}