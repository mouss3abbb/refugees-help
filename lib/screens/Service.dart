import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';


int currentIndex=0;
class Service extends StatelessWidget {
  Service({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}
//✰
//⭐
class data{
  String? image;
  double rate;
  String? name;
  data({this.image,required this.rate,this.name});
}
class data2{
  String? image;
  String? name;
  String? mapp;
  data2({this.image,this.name, this.mapp});
}
List<data> ca=[
  data(image: 'images/11.jpg',rate:5.0,name: 'مستشفى السادات التخصصي' ),
  data(image: 'images/22.jpg',rate: 4.5,name: 'مستشفى دار الشفاء'),
  data(image: 'images/33.jpg',rate:4.0,name: 'مستشفى لايف هيلث كير'),
  data(image: 'images/55.jpg',rate:5.0,name: 'صيدلية العزبي '),
  data(image: 'images/66.jpg',rate: 5.0,name: 'صيدلية والي '),];
List<data2> ca2=[
  data2(image: 'images/11.jpg',name: 'مستشفى السادات التخصصي',mapp: 'https://goo.gl/maps/sZwxSYtvh89PfsJ88'),
  data2(image: 'images/22.jpg',name: 'مستشفى دار الشفاء',mapp: 'https://goo.gl/maps/SsqAUFppEyQksUo78'),
  data2(image: 'images/33.jpg',name: 'مستشفى لايف هيلث كير',mapp: 'https://goo.gl/maps/dPD5GJgQqBf4pgA6A'),
  data2(image: 'images/77.jpg',name: 'مركز سمارت كير ',mapp: 'https://goo.gl/maps/HUr71L7DBEE8nF4v9'),
  data2(image: 'images/44.jpg',name: 'صيدلية النحاس ',mapp: 'https://goo.gl/maps/2Scj3cHVYCmUATfk7'),
  data2(image: 'images/55.jpg',name: 'صيدلية العزبي ',mapp: ''),
  data2(image: 'images/66.jpg',name: 'صيدلية والي ',mapp: ''),




];
class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
       
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('المقترحه',style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 5,),
                Container(
                  height: 220,
                  margin: EdgeInsets.all(5),
                  child: ListView(
                    children: [
                      CarouselSlider.builder(
                        itemCount:ca.length ,
                        itemBuilder: (context,int itemIndex,int pageIndex){
                          return slider(ca[itemIndex],context);
                        },
                        options: CarouselOptions(
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 1),
                          onPageChanged: (index,reason){
                            setState((){
                              currentIndex=index;
                            });
                          },

                        ),),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedSmoothIndicator(
                          activeIndex: currentIndex,count: ca.length,
                          effect: WormEffect(
                            spacing: 8,
                            radius: 4,
                            dotHeight: 10.0,
                            dotWidth: 10.0,
                            dotColor: Colors.black,
                            activeDotColor: Colors.white70,

                          ),),
                      )
                    ],
                  ),
                ),

                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 10,),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('المستشفيات والصيدليات المتاحه',style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
                SizedBox(height: 5,),
              /* Container(
                  //width: double.maxFinite,
                  //height: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: DefaultTabController(length: 2,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.black,
                        indicatorWeight: 3.5,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black45,
                        tabs: [
                          Tab(child:Text( 'المستشفيات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),),
                          Tab(child:Text( 'الصيدليات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                        ],
                      ),
                    ),
                  ),
                ),*/


                SizedBox(height: 20,),
                SingleChildScrollView(
                  child: Container(
                    height: 1070,
                    margin: EdgeInsets.all(5),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index)=> newList(ca2[index]),
                     // separatorBuilder: (context,index)=>SizedBox(height: 5,),
                      itemCount: ca2.length,
                    ),
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }
}


Widget slider(data d,BuildContext context){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('${d.image}', fit: BoxFit.fill,),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(0,5)
              )
            ]
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20,bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin:Alignment.bottomCenter ,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black12,
                Colors.transparent,
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${d.name}',style:
              TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
              Row(

                children: [
                  RatingBarIndicator(
                    rating: d.rate!,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    unratedColor: Colors.white,

                  ),

                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}




Widget newList(data2 d2){
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.all(10.0),
    height: 160,
    decoration: BoxDecoration(
      color: Color(0XFF92918D),
     // color: Colors.black,
      borderRadius: BorderRadius.circular(26),
    ),
    child: Row(
      children: [
        Flexible(child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage('${d2.image}'),
              fit: BoxFit.fitHeight,
            ),
          ),
        )),
        SizedBox(width: 10,),
        Flexible(
          // flex:1 ,
            child: Column(children: [
            Text('${d2.name}',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w900,
              fontSize: 20
            ),),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: 40,
                    ),
                    onTap: (){
                      urlLaunch(d2);
                    },

                  ),
                ],
              ),*/
              SizedBox(height: 20,),

              Material(
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: InkResponse(
                  splashColor: Colors.black12,
                  focusColor: Colors.black12,
                  hoverColor: Colors.black,
                  highlightColor: Colors.black12,
                  onTap: (){
                    urlLaunch(d2);
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    width: 46,
                    height:50,
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(40.0),
                      image: DecorationImage(
                        image: AssetImage('images/loc.jpg'),
                        //fit: BoxFit.fitHeight,

                      ),
                    ),
                  ),
                ),
              ),
        ],),
        ),
      ],
    ),
  );
}

urlLaunch(data2 d2) async{
  String url='${d2.mapp}';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw "Could not launch $url";
  }
}


Widget card(data d,BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          width: 250,
          height: 280,
          decoration: BoxDecoration(

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
            color: Color(0xFFE8E5E1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:Column(
            children: [

              Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("${d.image}",
                    ),
                  )
              ),
              //  SizedBox(height: 2,),


              Row(
                children: [
                  SizedBox(width: 10,),
                  Text('${d.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Text('${d.rate}',style: TextStyle(fontSize: 30,color: Colors.amber),),
                ],
              ),

            ],
          ) ,
        ),
      ],
    ),
  );

}



/* Column(
        children: [

          Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("${d.image}",
                ),
              )
          ),
        //  SizedBox(height: 2,),

          Row(
            children: [
              Text('${d.rate}',style: TextStyle(fontSize: 30,color: Colors.amber),),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10,),
              Text('${d.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          )

        ],
      ),*/



/*  Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
               gradient: LinearGradient(
                 colors: [Colors.transparent,Colors.black],
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter
               )
            ) ,


        ),*/



/*Column(
      children: [
        Container(
          width: 250,
          height: 400,
          decoration: BoxDecoration(

             boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            color: Color(0xFFE8E5E1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:Column(
            children: [

              Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("${d.image}",
                    ),
                  )
              ),
              //  SizedBox(height: 2,),

              Row(
                children: [
                  Text('${d.rate}',style: TextStyle(fontSize: 30,color: Colors.amber),),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text('${d.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              )

            ],
          ) ,
        ),
      ],
    )*/