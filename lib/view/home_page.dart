import 'package:country_picker/country_picker.dart';
import 'package:covid_19_beta/controller/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'widgets/counter.dart';
import 'widgets/my_header.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final TextEditingController countryController = TextEditingController();

  final ApiService controller = Get.put(ApiService());

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
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                            bottomSheetHeight: 500,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            inputDecoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: Icon(Icons.search),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          onSelect: (Country country) {
                            print('Select country: ${country.displayName}');
                            countryController.text =
                                '${country.flagEmoji}\t${country.displayNameNoCountryCode}';
                            controller.getCountryData(country.countryCode);
                          },
                        );
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: countryController,
                          decoration: const InputDecoration(
                              hintText: 'Search by country',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: countryController,
                    builder: (context, value, child) => IconButton(
                        onPressed: () {
                          countryController.clear();
                          controller.getData();
                        },
                        icon: Icon(
                          Icons.close,
                          color: countryController.text.isEmpty
                              ? Colors.transparent
                              : Colors.blueGrey,
                        )),
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
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NewWidget(
                                  number: countryController.text.isEmpty
                                      ? controller.allData['cases'].toString()
                                      : controller.countrywiseData.isEmpty
                                          ? '0'
                                          : controller.countrywiseData[0].cases
                                              .toString(),
                                  color: const Color(0xFFFF8748),
                                  title: 'infected',
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                NewWidget(
                                  number: countryController.text.isEmpty
                                      ? controller.allData['deaths'].toString()
                                      : controller.countrywiseData.isEmpty
                                          ? '0'
                                          : controller.countrywiseData[0].deaths
                                              .toString(),
                                  color: const Color(0xFFFF4848),
                                  title: 'deaths',
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                NewWidget(
                                  number: countryController.text.isEmpty
                                      ? controller.allData['recovered']
                                          .toString()
                                      : controller.countrywiseData.isEmpty
                                          ? '0'
                                          : controller
                                              .countrywiseData[0].recovered
                                              .toString(),
                                  color: const Color(0xFF36C12C),
                                  title: 'recovered',
                                )
                              ],
                            ),
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
