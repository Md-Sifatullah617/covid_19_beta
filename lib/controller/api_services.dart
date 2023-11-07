import 'package:covid_19_beta/model/all_countrydata.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ApiService {
  static List<AllCountryRecord> countryData = [];
  static List countryList = [];
  static Future<void> getCountryData() async {
    String url = "https://www.worldometers.info/coronavirus/";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      var table = document.getElementById("main_table_countries_today");
      var tbody = table!.getElementsByTagName("tbody");
      var rows = tbody[0].getElementsByTagName("tr");
      for (int i = 8; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");
        countryList.add(cells[1].text);
        countryData.add(AllCountryRecord(
          countryName: cells[1].text,
          newCases: cells[2].text,
          totalDeaths: cells[3].text,
          newDeaths: cells[4].text,
          totalRecovered: cells[5].text,
          newRecovered: cells[6].text,
          activCases: cells[7].text,
        ));
      }
      print(
          'country name ${countryList.length} \n $countryList \n ${countryData.length} \n ${countryData.first.countryName}}');
    } else {
      print('error');
    }
  }
}
