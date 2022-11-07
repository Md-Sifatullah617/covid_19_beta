import 'package:covid_19_beta/widgets/counter.dart';
import 'package:covid_19_beta/widgets/my_header.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeader(image: 'assets/icons/Drcorona.svg', textTop: 'All you need', textBottom: 'is stay at home',),
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
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Case Update\n",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff303030))),
                        TextSpan(
                            text: "Newest update March 28",
                            style: TextStyle(color: Color(0xFF959595))),
                      ])),
                      const Spacer(),
                      const Text(
                        "See details",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3382CC)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 30,
                              color: const Color(0xFFB7B7B7).withOpacity(.16))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        NewWidget(
                          number: 1050,
                          color: Color(0xFFFF8748),
                          title: 'infected',
                        ),
                        NewWidget(
                          number: 87,
                          color: Color(0xFFFF4848),
                          title: 'deaths',
                        ),
                        NewWidget(
                          number: 46,
                          color: Color(0xFF36C12C),
                          title: 'recovered',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'spread of virus',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF303030)),
                      ),
                      Text(
                        "See Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3382CC)),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,10),
                          blurRadius: 30,
                          color: Color(0xFFB7B7B7).withOpacity(.16)
                        ),
                      ]
                    ),
                    child: Image.asset('assets/images/map.png', fit: BoxFit.contain,),
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



