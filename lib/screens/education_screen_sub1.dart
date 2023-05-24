import 'package:flutter/material.dart';
import 'package:refugees_help/screens/education_screen_sub22.dart';
import 'package:url_launcher/url_launcher.dart';


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
List<data> schools = [];
List<data> sadatSchools=[
  data( schoolName: 'المتفوقين للعلوم والتكنولوجيا',
    schoolNameE: 'Sadat STEM high School',
    schoolImg: 'assets/images/stem.jfif',
    schoolType:'حكومية',
    schoolURL: 'https://sadatstem.com/en/web/register_student',
    address:'الظهير الصحراوى لمدينة السادات، المنوفية',
    addressURL: 'https://goo.gl/maps/z3PHxg1BTri8td5H6',
    phone:'11111111111',
    schoolScreen:details(dataIndex: 0),
  ),
  data( schoolName: 'الجيل الجديد الدولية',
    schoolNameE: 'New Generation International School',
    schoolImg: 'assets/images/ngis.png',
    schoolType:'دولية',
    schoolURL: 'https://www.ngischools.com/',
    address:' شارع ابوبكر الصديق، بجوار مول دار مصر',
    addressURL: 'https://goo.gl/maps/VAyMW7wEUW1LY5RR6',
    phone:'0155 555 2082',
    schoolScreen:details(dataIndex: 1),
  ),
  data( schoolName: 'النيل المصرية',
    schoolNameE:'Nile Egyptian Schools',
    schoolImg: 'assets/images/nile.jfif',
    schoolType:'دولية',
    schoolURL: 'https://nes.moe.gov.eg/',
    address:'المنطقة السابعه، مدينة السادات',
    addressURL: 'https://goo.gl/maps/uHZy4tc5ZgTMuvwo6',
    phone:'01275931480',
    schoolScreen:details(dataIndex: 2),
  ),
  data( schoolName: 'Oxford college ',
    schoolNameE:'Oxford college School',
    schoolImg: 'assets/images/oxford.jfif',
    schoolType:'دولية',
    schoolURL: '',
    address:'المنطقة التاسعة، مدينة السادات',
    addressURL: '',
    phone:'01200512557',
    schoolScreen:details(dataIndex: 3),
  ),
  data( schoolName: 'المستقبل الدولية',
    schoolNameE:'Future International School',
    schoolImg: 'assets/images/future.jfif',
    schoolType:'دولية',
    schoolURL: '',
    address:'الظهير الصحراوى لمدينة السادات، المنوفية',
    addressURL: 'https://goo.gl/maps/EkhvxtmqBHfQztNP8',
    phone:'0121 144 4464',
    schoolScreen:details(dataIndex: 4),
  ),
  data( schoolName: 'كامبريدج للغات',
    schoolNameE:'Cambridge Languages School',
    schoolImg: 'assets/images/c.jpg',
    schoolType:'دولية',
    schoolURL: 'https://web.facebook.com/cambridge.language.schools/?_rdc=1&_rdr',
    address:' المنطقة الثانية عشر، مدينة السادات',
    addressURL: 'https://goo.gl/maps/pBxwkBLUFfLdLtLV9',
    phone:'0155 628 8008',
    schoolScreen:details(dataIndex: 5),
  ),
  data( schoolName:'سارة سعد نواره',
    schoolNameE: 'Sara Saad Nawara School',
    schoolImg: 'assets/images/ss.jpg',
    schoolType:'حكومية',
    schoolURL: 'https://web.facebook.com/nasserk7/?locale=ar_AR&_rdc=1&_rdr',
    address:'المنطقة التاسعة، مدينة السادات',
    addressURL: 'https://goo.gl/maps/KHTCLiTniaKbULq87',
    phone:'01234567890',
    schoolScreen:details(dataIndex: 6),
  ),
  data( schoolName: 'السادات الرسمية لغات',
    schoolNameE:'Sadat Experimental School of Languages',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'حكومية',
    schoolURL: 'https://web.facebook.com/groups/1589751941310869/?_rdc=1&_rdr',
    address:'المنطقة الثالثة، مدينة السادات',
    addressURL: 'https://goo.gl/maps/AdF6mT8uJEum3NnQ9',
    phone:'2610001',
    schoolScreen:details(dataIndex: 7),
  ),
  data( schoolName:'السادات الثانويه للبنات',
    schoolNameE: 'Sadat City High School for girls',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'حكومية',
    schoolURL: 'https://shorturl.at/kCJS3',
    address:'شارع عبدالله بن رواحة، مدينة السادات',
    addressURL: 'https://goo.gl/maps/pSB9NzKhMhSzFijz9',
    phone:'048 3558221',
    schoolScreen:details(dataIndex: 8),
  ),
  data( schoolName:'الفاروق الثانويه للبنين',
    schoolNameE: 'Alfarouk High School for boys',
    schoolImg: 'assets/images/ministry.png',
    schoolType:'حكومية',
    schoolURL: 'https://shorturl.at/tDHZ1',
    address:'المنطقة السكنية الحادية عشر، مدينة السادات',
    addressURL: 'https://goo.gl/maps/hWjCBHRdRTry7PPr5',
    phone:'048 2610006',
    schoolScreen:details(dataIndex: 9),
  ),
  data( schoolName:'القادسية الخاصة',
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

List<data> cairoSchools = [
  data( schoolName:'مدرسة بالم الدولية',
    schoolNameE: 'Palm International School',
    schoolImg: 'assets/images/cairo_palm.jpeg',
    schoolType:'خاصة',
    schoolURL: 'https://visionseducational.com/acadp_listings/al-qadisiyah-private-school-alsaadat/',
    address:'مدينة النخيل - الطيق الدائري',
    addressURL: 'https://goo.gl/maps/7vSagp6nFCFtP8rDA',
    phone:'01280658581',
    schoolScreen:details(dataIndex: 0),
  ),
  data( schoolName:'مدرسة روضة مصر',
    schoolNameE: 'Rawdat Misr School',
    schoolImg: 'assets/images/cairo_rawda.webp',
    schoolType:'خاصة',
    schoolURL: 'https://visionseducational.com/acadp_listings/al-qadisiyah-private-school-alsaadat/',
    address:'8 شارع سمعان - دوران شبرا',
    addressURL: 'https://goo.gl/maps/7vSagp6nFCFtP8rDA',
    phone:'01280658581',
    schoolScreen:details(dataIndex: 1),
  ),
];

List<data> octoberSchools = [
  data( schoolName:'مدرسة ايليت للغات',
    schoolNameE: 'Elite Language School',
    schoolImg: 'assets/images/october_els.webp',
    schoolType:'خاصة',
    schoolURL: 'https://visionseducational.com/acadp_listings/al-qadisiyah-private-school-alsaadat/',
    address:'كومباوند سكن مصر - طريق الواحات',
    addressURL: 'https://goo.gl/maps/7vSagp6nFCFtP8rDA',
    phone:'01280658581',
    schoolScreen:details(dataIndex: 0),
  ),
  data( schoolName:'مدرسة ايبيك الدولية',
    schoolNameE: 'EPIC School Egypt',
    schoolImg: 'assets/images/october_epic.webp',
    schoolType:'خاصة',
    schoolURL: 'https://visionseducational.com/acadp_listings/al-qadisiyah-private-school-alsaadat/',
    address:'كومباوند الخمايل',
    addressURL: 'https://goo.gl/maps/7vSagp6nFCFtP8rDA',
    phone:'01280658581',
    schoolScreen:details(dataIndex: 1),
  ),
];


class education_screen_sub1 extends StatelessWidget {
  const education_screen_sub1({super.key, required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return MySub1(cityName: cityName,);
  }
}
class MySub1 extends StatefulWidget {
  MySub1({super.key, required this.cityName});
  final String cityName;
  @override
  State<MySub1> createState() => _MySub1(cityName);
}
class _MySub1 extends State<MySub1> {
  final String cityName;

  _MySub1(this.cityName);
  @override
  void initState() {
    super.initState();
    if(cityName == 'السادات'){
      schools = sadatSchools;
    }
    if(cityName == 'أكتوبر'){
      schools = octoberSchools;
    }
    if(cityName == 'القاهرة'){
      schools = cairoSchools;
    }
  }
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
              itemBuilder: (context, index) =>
                  buildCount(schools[index], context),
              separatorBuilder: (context, index) => SizedBox(height: 15,)
              , itemCount: schools.length),
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
                        backgroundImage: AssetImage("${d.schoolImg}"),
                        backgroundColor: Colors.white,
                      ),
                )),
                SizedBox(width: 5,),
                Flexible(
                  // flex:1 ,
                  child: Center(
                    child: Column(children: [
                      SizedBox(height: 25,),
                      Text('${d.schoolName}',style: TextStyle(
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
                                (context)=>d.schoolScreen);
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

      backgroundColor: Color(0xffffffff).withOpacity(0),
      body: Container(
        child: buildCount2(schools[dataIndex], context),

      ),
    );
  }
}

Widget buildCount2(data d,BuildContext context){
  return Container(
    decoration: const BoxDecoration(
      color: Color(0xFFFFFFFF),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),

      ),
    ),

    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
              height: 5,
              width: 60,
              color: Color(0xff506169).withOpacity(0.99)
          ),
          SizedBox(height: 20,),
          Container(
            height: 120,
            child: Card(

              color: Color(0xff3c4a50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),

              ),
              child: Center(
                child: ListTile (
                  leading: Flexible(child: Container(
                    child:  CircleAvatar(
                      radius: 30, // Image radius
                      backgroundImage: AssetImage("${d.schoolImg}"),
                      backgroundColor: Colors.white,
                    ),
                  )),
                  title:  Text("${d.schoolName}\n ${d.schoolNameE}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),),
                  trailing: Text("${d.schoolType}",style: TextStyle(color: Colors.white, fontSize: 16,),),
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children:[
                    Icon(Icons.school,color: Color(0xffe18a16),),
                  Text("${d.schoolURL}",overflow: TextOverflow.clip),
                ]
            ),
          ),
          Row(
              children:[
                  Icon(Icons.location_city, color: Colors.blueGrey,),
                Text("${d.address}",overflow: TextOverflow.fade),
              ]
          ),
          Row(
              children:[
                  Icon(Icons.location_on,color: Colors.red.shade700,),
                Text("${d.addressURL}",overflow: TextOverflow.fade),
              ]
          ),



          SizedBox(height: 40,),
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
    ),
  );
}