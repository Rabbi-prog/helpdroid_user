// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

List<Covid> covidFromJson(String str) => List<Covid>.from(json.decode(str).map((x) => Covid.fromJson(x)));

String covidToJson(List<Covid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid {
  Covid({
    this.newRecovered,
    this.countryregion,
    this.newDeaths,
    this.totalRecovered,
    this.latitude,
    this.countrycode,
    this.totalCases,
    this.confirmed,
    this.seriousCases,
    this.activeCases,
    this.recovered,
    this.name,
    this.totalTests,
    this.bnName,
    this.newCases,
    this.totalDeaths,
    this.rationPerMillion,
    this.deaths,
    this.longitude,
  });

  int newRecovered;
  String countryregion;
  int newDeaths;
  int totalRecovered;
  String latitude;
  Countrycode countrycode;
  int totalCases;
  int confirmed;
  int seriousCases;
  int activeCases;
  int recovered;
  String name;
  int totalTests;
  String bnName;
  int newCases;
  int totalDeaths;
  int rationPerMillion;
  int deaths;
  String longitude;

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
    newRecovered: json["NewRecovered"],
    countryregion: json["countryregion"],
    newDeaths: json["NewDeaths"],
    totalRecovered: json["TotalRecovered"],
    latitude: json["latitude"],
    countrycode: Countrycode.fromJson(json["countrycode"]),
    totalCases: json["TotalCases"],
    confirmed: json["confirmed"],
    seriousCases: json["SeriousCases"],
    activeCases: json["ActiveCases"],
    recovered: json["recovered"],
    name: json["name"],
    totalTests: json["TotalTests"],
    bnName: json["bnName"],
    newCases: json["NewCases"],
    totalDeaths: json["TotalDeaths"],
    rationPerMillion: json["RationPerMillion"],
    deaths: json["deaths"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "NewRecovered": newRecovered,
    "countryregion": countryregion,
    "NewDeaths": newDeaths,
    "TotalRecovered": totalRecovered,
    "latitude": latitude,
    "countrycode": countrycode.toJson(),
    "TotalCases": totalCases,
    "confirmed": confirmed,
    "SeriousCases": seriousCases,
    "ActiveCases": activeCases,
    "recovered": recovered,
    "name": name,
    "TotalTests": totalTests,
    "bnName": bnName,
    "NewCases": newCases,
    "TotalDeaths": totalDeaths,
    "RationPerMillion": rationPerMillion,
    "deaths": deaths,
    "longitude": longitude,
  };
}

class Countrycode {
  Countrycode({
    this.iso3,
  });

  String iso3;

  factory Countrycode.fromJson(Map<String, dynamic> json) => Countrycode(
    iso3: json["iso3"],
  );

  Map<String, dynamic> toJson() => {
    "iso3": iso3,
  };
}
