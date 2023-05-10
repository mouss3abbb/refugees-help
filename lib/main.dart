import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refugees_help/screens/job.dart';
import 'package:refugees_help/screens/login_screen.dart';
import 'package:refugees_help/screens/main_screen.dart';
import 'package:refugees_help/screens/education_screen.dart';
import 'package:refugees_help/screens/register_screen.dart';
import 'package:refugees_help/screens/splash_screen.dart';

Future main() async {
  await Hive.initFlutter();
  var cityBox = await Hive.openBox('saved_cities');
  var jobBox = await Hive.openBox('saved_jobs');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      home: MainScreen(),
    );
  }
}
