import 'dart:convert';

List<AllCountryRecord> allCountryRecordFromJson(String str) =>
    List<AllCountryRecord>.from(
        json.decode(str).map((x) => AllCountryRecord.fromJson(x)));

class AllCountryRecord {
  String? countryName;
  String? newCases;
  String? totalDeaths;
  String? newDeaths;
  String? totalRecovered;
  String? newRecovered;
  String? activCases;

  AllCountryRecord({
    this.countryName,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.newRecovered,
    this.activCases,
  });

  factory AllCountryRecord.fromJson(Map<String, dynamic> json) {
    return AllCountryRecord(
      countryName: json['countryName'],
      newCases: json['newCases'],
      totalDeaths: json['totalDeaths'],
      newDeaths: json['newDeaths'],
      totalRecovered: json['totalRecovered'],
      newRecovered: json['newRecovered'],
      activCases: json['activCases'],
    );
  }
}
