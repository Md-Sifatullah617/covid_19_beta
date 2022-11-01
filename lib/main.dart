import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFEFEFE),
          fontFamily: "Poppins",
          textTheme:
              const TextTheme(bodyText1: TextStyle(color: Color(0xFF4B4B4B)))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
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
                  image: DecorationImage(
                      image: AssetImage("assets/images/virus.png"))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/menu.svg")),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      SvgPicture.asset("assets/icons/Drcorona.svg",
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter),
                      const Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'All you need\nStay at home.',
                            style: TextStyle(
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color(0xffe5e5e5))),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: 'Bangladesh',
                      items: [
                        'Bangladesh',
                        'Pakistan',
                        'India',
                        'Indonesia',
                        'United States',
                        'Japan'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value){},
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Case Update\n",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff303030))
                        ),
                        TextSpan(
                          text: "Newest update March 28",
                          style: TextStyle(color: Color(0xFF959595))
                        )
                      ]
                    ) )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
