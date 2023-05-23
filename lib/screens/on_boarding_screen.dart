import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final controller = LiquidController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            enableLoop: false,
            liquidController: controller,
              onPageChangeCallback: (index)=>setState(() {
                currentPage=index;
              }),
              pages: [
                buildPage(
                    Colors.grey[200]!,
                    [
                    'مرحبا بك في ',
                    'بيتك!',
                    'بيتك ',
                    'يساعدك في الاستقرار في مصر بتقديم العديد من الخدمات في الصحة والتعليم والعمل',
                  ],
                    'https://assets3.lottiefiles.com/private_files/lf30_TBKozE.json'
                ),
                buildPage(
                    Color(0xfffff2bb)!,
                    [
                      '',
                  'التعليم',
                  'بيتك ',
                  'يوفر لك أفضل المدارس والجامعات في مدن مصر ويعرفك على مميزاتها ويتيح لك التواصل معهم'
                ], 'https://assets10.lottiefiles.com/packages/lf20_DMgKk1.json'),
                buildPage(
                Colors.lightGreen[100]!, [
                  '',
                  'الصحة',
                  'بيتك ',
                'يتيح لك أهم الخدمات الصحية مثل الصيدليات والمستشفيات الخاصة بكل مدينة'
                ],
                'https://assets9.lottiefiles.com/packages/lf20_0fhlytwe.json'),
                buildPage(
                  Colors.blueGrey[100]!,
                [
                  '',
                  'العمل',
                  '',
                  'يمكنك التعرف على الوظائف المطلوبة في كل المدن أو البحث عن وظائف مدينة معينة والتواصل مع المسئول'
                ],
                'https://assets5.lottiefiles.com/packages/lf20_rpsybtsb.json'
                )
              ]
          ),
          Positioned(
            bottom: 10,
              child: AnimatedSmoothIndicator(
                axisDirection: Axis.horizontal,
                textDirection: TextDirection.ltr,
                count: 4,
                activeIndex: controller.currentPage,
                effect: ColorTransitionEffect(
                  activeDotColor: Colors.black87,
                  dotHeight: 2,
                ),
              )
          )
        ],

      ),
    );
  }

  buildPage(Color color,List<String> texts, String animationUrl) {
    return Container(
      color: color,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Lottie.network(animationUrl),
            SizedBox(height: 40),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black87,fontSize: 36,fontFamily: 'Massir'),
                    children: [
                      TextSpan(text: texts[0]),
                      TextSpan(text: texts[1],style: TextStyle(color: Colors.blue[600])),
                    ]
                )
            ),
            SizedBox(height: 10,),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black87,fontSize: 22,fontFamily: 'Massir'),
                    children: [
                      TextSpan(text: texts[2],style: TextStyle(color: Colors.blue[600])),
                      TextSpan(text: texts[3],style: TextStyle(
                        height: 1.5,
                      ))
                    ]
                )
            ),
            SizedBox(height: 40),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:controller.currentPage != 3? [
                  OutlinedButton(
                      onPressed: (){
                        controller.animateToPage(page: controller.currentPage+1);
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100,40)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                        foregroundColor: MaterialStatePropertyAll(Colors.blueAccent[200]),
                        backgroundColor: MaterialStatePropertyAll(Colors.white24),
                      ),
                      child: Text('التالي')
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login()));
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.black54),
                    ),
                    child: Text('تخطي'),
                  ),
                ]: [
                  OutlinedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login()));
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(120,40)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(Color(0xff506169),),
                      ),
                      child: Text('ابدأ الاستخدام!')
                  ),
                ],
              ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }


}

