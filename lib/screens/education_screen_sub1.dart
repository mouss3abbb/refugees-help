import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:refugees_help/screens/education_screen_sub2.dart';
import 'package:refugees_help/screens/education_screen.dart';


class data{
  @required String? schoolName;
  @required String? schoolNameE;
  @required String? schoolImg;
  @required String? schoolType;
  @required String schoolURL;
  @required String? address;
  @required String? addressURL;
  @required String? phone;
  Widget schoolScreen;

  data({required this.schoolName,
    required this.schoolNameE,
    this.schoolImg,
    required this.schoolType,
    required this.schoolURL ,
    required this.address,
    required this.addressURL,
    required this.phone,
    required this.schoolScreen});
}

List<data> school=[
  data( schoolName: 'مدرسة المتفوقين للعلوم والتكنولوجيا',
    schoolNameE: 'Sadat STEM high School',
    schoolImg: 'assets/images/stem.jfif',
    schoolType:'حكومية',
    schoolURL: 'https://sadatstem.com/en/web/register_student',
    address:'الظهير الصحراوى لمدينة السادات، المنوفية',
    addressURL: 'https://goo.gl/maps/z3PHxg1BTri8td5H6',
    phone:'11111111111',
    schoolScreen:details(dataIndex: 0),
  ),
  data( schoolName: 'مدارس الجيل الجديد الدولية',
    schoolNameE: 'New Generation International School',
    schoolImg: 'assets/images/ngis.png',
    schoolType:'دولية',
    schoolURL: 'https://www.ngischools.com/',
    address:' شارع ابوبكر الصديق، بجوار مول دار مصر',
    addressURL: 'https://goo.gl/maps/VAyMW7wEUW1LY5RR6',
    phone:'0155 555 2082',
    schoolScreen:details(dataIndex: 1),
  ),
  data( schoolName: 'مدارس النيل المصرية',
    schoolNameE:'Nile Egyptian Schools',
    schoolImg: 'assets/images/nile.jfif',
    schoolType:'دولية',
    schoolURL: 'https://nes.moe.gov.eg/',
    address:'المنطقة السابعه، مدينة السادات',
    addressURL: 'https://goo.gl/maps/uHZy4tc5ZgTMuvwo6',
    phone:'01275931480',
    schoolScreen:details(dataIndex: 2),
  ),
  data( schoolName: 'مدرسة Oxford college ',
    schoolNameE:'Oxford college School',
    schoolImg: 'assets/images/oxford.jfif',
    schoolType:'دولية',
    schoolURL: '',
    address:'المنطقة التاسعة، مدينة السادات',
    addressURL: '',
    phone:'01200512557',
    schoolScreen:details(dataIndex: 3),
  ),
  data( schoolName: 'مدارس المستقبل الدولية',
    schoolNameE:'Future International School',
    schoolImg: 'assets/images/future.jfif',
    schoolType:'دولية',
    schoolURL: '',
    address:'الظهير الصحراوى لمدينة السادات، المنوفية',
    addressURL: 'https://goo.gl/maps/EkhvxtmqBHfQztNP8',
    phone:'0121 144 4464',
    schoolScreen:details(dataIndex: 4),
  ),
  data( schoolName: 'مدرسة كامبريدج للغات',
    schoolNameE:'Cambridge Languages School',
    schoolImg: 'assets/images/c.jpg',
    schoolType:'دولية',
    schoolURL: 'https://web.facebook.com/cambridge.language.schools/?_rdc=1&_rdr',
    address:' المنطقة الثانية عشر، مدينة السادات',
    addressURL: 'https://goo.gl/maps/pBxwkBLUFfLdLtLV9',
    phone:'0155 628 8008',
    schoolScreen:details(dataIndex: 5),
  ),
  data( schoolName:'مدرسة سارة سعد نواره',
    schoolNameE: 'Sara Saad Nawara School',
    schoolImg: 'assets/images/ss.jpg',
    schoolType:'حكومية',
    schoolURL: 'https://web.facebook.com/nasserk7/?locale=ar_AR&_rdc=1&_rdr',
    address:'المنطقة التاسعة، مدينة السادات',
    addressURL: 'https://goo.gl/maps/KHTCLiTniaKbULq87',
    phone:'01234567890',
    schoolScreen:details(dataIndex: 6),
  ),
  data( schoolName: 'مدرسة السادات الرسمية لغات',
    schoolNameE:'Sadat Experimental School of Languages',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'حكومية',
    schoolURL: 'https://web.facebook.com/groups/1589751941310869/?_rdc=1&_rdr',
    address:'المنطقة الثالثة، مدينة السادات',
    addressURL: 'https://goo.gl/maps/AdF6mT8uJEum3NnQ9',
    phone:'2610001',
    schoolScreen:details(dataIndex: 7),
  ),
  data( schoolName:'مدرسة السادات الثانويه للبنات',
    schoolNameE: 'Sadat City High School for girls',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'حكومية',
    schoolURL: 'https://shorturl.at/kCJS3',
    address:'شارع عبدالله بن رواحة، مدينة السادات',
    addressURL: 'https://goo.gl/maps/pSB9NzKhMhSzFijz9',
    phone:'048 3558221',
    schoolScreen:details(dataIndex: 8),
  ),
  data( schoolName:'مدرسه الفاروق الثانويه للبنين',
    schoolNameE: 'Alfarouk High School for boys',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'حكومية',
    schoolURL: 'https://shorturl.at/tDHZ1',
    address:'المنطقة السكنية الحادية عشر، مدينة السادات',
    addressURL: 'https://goo.gl/maps/hWjCBHRdRTry7PPr5',
    phone:'048 2610006',
    schoolScreen:details(dataIndex: 9),
  ),
  data( schoolName:'مدرسه القادسية الخاصة',
    schoolNameE: 'Al-Qadisiyah school',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'خاصة',
    schoolURL: 'https://visionseducational.com/acadp_listings/al-qadisiyah-private-school-alsaadat/',
    address:'جابر بن حيان بجوار مسجد الايمان',
    addressURL: 'https://goo.gl/maps/7vSagp6nFCFtP8rDA',
    phone:'01280658581',
    schoolScreen:details(dataIndex: 10),
  ),
];
class education_screen_sub1 extends StatelessWidget {
  const education_screen_sub1({super.key});

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "المدارس",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: BackButton(
            color: Colors.black54,
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Color(0xffEFECE7),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildCount(school[index], context),
              separatorBuilder: (context, index) => SizedBox(height: 15,)
              , itemCount: school.length),
        ),
      ),
    );
  }
  calling()async{
    const url= 'tel:+201025027368';
    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not lanch $url';
    }
  }
  email(){
    launch('mailto:rahmaKh871@gmail.com?subject=TestEmail&body=I am typing this test email%20plugin');

  }
  urlLaunch() async{
    const url='https://www.facebook.com/profile.php?id=100045898622314';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not launch $url";

    }
  }

}

Widget buildCount(data d,BuildContext context){
  return SingleChildScrollView(
    child: Column(

      children:[
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
        Card(
          //color: Color(0xffCCC8BF),
          color: Color(0xff3c4a50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile (
            leading: CircleAvatar(
              radius: 25, // Image radius
              backgroundImage: AssetImage("${d.schoolImg}"),
              backgroundColor: Colors.white,
            ),
            title:  Text("${d.schoolName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
            ),
            trailing: ElevatedButton(
              child: Text('تفاصيل',style: TextStyle(fontSize:13,fontWeight: FontWeight.w900,),),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Color(0xffEFECE7),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, builder:
                    (context)=>d.schoolScreen);
                //getindx(d.schoolName);
              },
              //_navigateToNextScreen(context);
            ),
          ),
        ),
      ],
    ),
  );
}

class details extends StatelessWidget {

  final int dataIndex;

  const details({super.key, required this.dataIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Color(0xffEFECE7).withOpacity(0),
      body: Container(
        child: buildCount2(school[dataIndex], context),

      ),
    );
  }
}

Widget buildCount2(data d,BuildContext context){
  return Container(

    decoration: const BoxDecoration(
      color: Color(0xFFE8E5E1),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),

      ),
    ),

    child: Column(
      children: [
        SizedBox(height: 10,),
        Container(
            height: 5,
            width: 60,
            color: Color(0xff9cb5bc).withOpacity(0.99)
        ),
        SizedBox(height: 20,),
        Card(
          color: Color(0xff3c4a50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          child: ListTile (
            leading: CircleAvatar(
              radius: 25, // Image radius
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("${d.schoolImg}"),
            ),
            title:  Text("${d.schoolName}\n ${d.schoolNameE}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white),),
            trailing: Text("${d.schoolType}",style: TextStyle(color: Colors.white, fontSize: 14,),),
          ),
        ),
        SizedBox(height: 40,),
        Row(
            children:[
              IconButton(
                onPressed: (){
                  //action coe when button is pressed
                },
                icon: Icon(Icons.school),
              ),
              Text("${d.schoolURL}"),
            ]
        ),
        Row(
            children:[
              IconButton(
                onPressed: (){
                  //action coe when button is pressed
                },
                icon: Icon(Icons.location_city),
              ),
              Text("${d.address}"),
            ]
        ),
        Row(
            children:[
              IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.location_on),
              ),
              Text("${d.addressURL}"),
            ]
        ),



        SizedBox(height: 40,),
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
  );
}