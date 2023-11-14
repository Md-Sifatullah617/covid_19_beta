import 'dart:convert';
import 'package:covid_19_beta/model/country_wise_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxController {
  var isLoading = false.obs;
  Map allData = {};
  List<CountrywiseData> countrywiseData = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    var response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      allData = json.decode(response.body);
      print(' ${allData['cases']}');
      isLoading.value = false;
    } else {
      isLoading.value = false;
      print(response.statusCode);
    }
  }

  Future<void> getCountryData(String country) async {
    isLoading.value = true;
    var response = await http
        .get(Uri.parse('https://disease.sh/v3/covid-19/countries/$country'));
    if (response.statusCode == 200) {
      countrywiseData.clear();
      countrywiseData.add(CountrywiseData.fromJson(json.decode(response.body)));
      print("url: ${response.request?.url}");
      print('${countrywiseData[0].country} ${countrywiseData[0].cases}');
      isLoading.value = false;
    } else {
      isLoading.value = false;
      countrywiseData.clear();
      print(response.statusCode);
    }
  }
}
