import 'package:covid_19_beta/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFEFEFE),
          fontFamily: "Poppins",
          textTheme:
              const TextTheme(bodyLarge: TextStyle(color: Color(0xFF4B4B4B)))),
      home: const SplashScreen(),
    );
  }
}
