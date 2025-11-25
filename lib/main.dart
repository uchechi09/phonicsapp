import 'package:flutter/material.dart';
import 'package:phonicsapp/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiddies PhonicsMix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amberAccent.shade100,
        ),
        primaryColor: Colors.amberAccent.shade100,
        scaffoldBackgroundColor: Colors.grey.shade200,
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            fixedSize: Size.fromHeight(50),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}
