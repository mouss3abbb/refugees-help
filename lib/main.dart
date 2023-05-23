import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refugees_help/screens/RestaurantsPage.dart';
import 'package:refugees_help/screens/login_screen.dart';
import 'package:refugees_help/screens/main_screen.dart';
import 'package:refugees_help/screens/menuScreen.dart';
import 'package:refugees_help/screens/splash_screen.dart';
import 'package:refugees_help/screens/profile_screen.dart';
import 'package:get/get.dart';

String loggedUser = "";

Future main() async {
  await Hive.initFlutter();
  await Hive.openBox('saved_cities');
  await Hive.openBox('saved_jobs');
  await Hive.openBox('users');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'refugees_help',
      locale: Locale('ar'),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'),
      ],
      theme: ThemeData(fontFamily: 'Massir'),
      home: Splash(),
    );
  }
}