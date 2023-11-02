import 'package:animate_do/animate_do.dart';
import 'package:covid_19_beta/view/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Spin(
          infinite: true,
          child: Image.asset(
            "assets/images/corona.png",
          )),
    );
  }
}
