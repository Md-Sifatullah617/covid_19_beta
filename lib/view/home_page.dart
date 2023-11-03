import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/counter.dart';
import 'widgets/my_header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeader(
              image: 'assets/icons/Drcorona.svg',
              textTop: 'All you need',
              textBottom: 'is stay at home',
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xffe5e5e5))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CountryCodePicker(
                      padding: EdgeInsets.zero,
                      onChanged: ((value) {
                        countryController.text = value.name!;
                        print(value.name);
                      }),
                      initialSelection: 'BD',
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: true,
                    ),
                  ),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                              offset: const Offset(0, 10),
                              blurRadius: 30,
                              color: const Color(0xFFB7B7B7).withOpacity(.16)),
                        ]),
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.contain,
                    ),
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
