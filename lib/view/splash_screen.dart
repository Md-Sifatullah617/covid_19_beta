import 'package:animate_do/animate_do.dart';
import 'package:covid_19_beta/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spin(
            infinite: true,
            child: Image.asset(
              "assets/images/corona.png",
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          BounceInDown(
            duration: const Duration(seconds: 2),
            child: Text(
              "Covid View",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 30.sp,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
