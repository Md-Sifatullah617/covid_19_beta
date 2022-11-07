import 'package:covid_19_beta/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeader(
                image: "assets/icons/coronadr.svg",
                textTop: "Get to know",
                textBottom: "About Covid-19"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Symptoms",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF303030)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SymptomsCard(
                        image: 'assets/images/headache.png',
                        title: 'Headache',
                        isActive: true,
                      ),
                      SymptomsCard(
                        image: 'assets/images/caugh.png',
                        title: 'Caugh',
                      ),
                      SymptomsCard(
                        image: 'assets/images/fever.png',
                        title: 'Fever',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Prevention",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF303030)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PreventedCard(
                    image: 'assets/images/wear_mask.png',
                    title: 'Wear face mask',
                    text:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing faemasks",
                  ),
                  const PreventedCard(
                    image: 'assets/images/wash_hands.png',
                    title: 'Wash your hands',
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing faemasks",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventedCard extends StatelessWidget {
  const PreventedCard(
      {Key? key, required this.image, required this.title, required this.text})
      : super(key: key);
  final String image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                        color: const Color(0xFFB7B7B7).withOpacity(.16))
                  ]),
            ),
            Image.asset(image),
            Positioned(
                left: 130,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 140,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF303030)),
                      ),
                      Text(
                        text,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset("assets/icons/forward.svg"))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  final String image;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    color: const Color(0xFF4056C6).withOpacity(.15))
                : BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                    color: const Color(0xFFB7B7B7).withOpacity(.16)),
          ]),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
