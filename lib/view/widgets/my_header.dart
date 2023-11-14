import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page.dart';
import '../info_screen.dart';
import 'counter.dart';

int counter = 0;

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key? key,
    required this.image,
    required this.textTop,
    required this.textBottom,
  }) : super(key: key);

  final String image;
  final String textTop;
  final String textBottom;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff3383cd), Color(0xff11249f)]),
            image:
                DecorationImage(image: AssetImage("assets/images/virus.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: SvgPicture.asset("assets/icons/menu.svg"),
                  onTap: () {
                    if (counter == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoScreen()));
                      counter += 1;
                    } else {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                      counter -= 1;
                    }
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Stack(
              children: [
                SvgPicture.asset(image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter),
                Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      '$textTop\n$textBottom.',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                Container(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
