import 'package:flutter/material.dart';
import 'package:score_belote/screens/splash_screen.dart';
import 'package:score_belote/theme/app_colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score?',
      theme: ThemeData(
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: AppColors.cream,
        appBarTheme: AppBarTheme(
          //theme de l'appBar
          backgroundColor: AppColors.wine,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.cream,
          ),
          iconTheme: const IconThemeData(color: AppColors.gold),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.wine),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const SplashScreen(),
    );
  }
}
