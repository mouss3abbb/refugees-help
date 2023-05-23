import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:refugees_help/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:refugees_help/screens/on_boarding_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 150,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.scaleTransition,
        splash: Image.asset('assets/images/home.gif',width: 1.5*MediaQuery.of(context).size.width/2,),
        nextScreen: const OnBoardingScreen(),
        duration: 4000,
        animationDuration: const Duration(seconds: 2));
  }
}
