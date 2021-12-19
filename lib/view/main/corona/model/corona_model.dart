// To parse this JSON data, do
//
//     final coronaModel = coronaModelFromJson(jsonString);

import 'dart:convert';

List<CoronaModel> coronaModelFromJson(String str) => List<CoronaModel>.from(json.decode(str).map((x) => CoronaModel.fromJson(x)));

String coronaModelToJson(List<CoronaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoronaModel {
  CoronaModel({
    this.id,
    this.country,
    this.countryCode,
    this.province,
    this.city,
    this.cityCode,
    this.lat,
    this.lon,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.active,
    this.date,
  });

  String? id;
  String? country;
  String? countryCode;
  String? province;
  String? city;
  String? cityCode;
  String? lat;
  String? lon;
  int? confirmed;
  int? deaths;
  int? recovered;
  int? active;
  DateTime? date;

  factory CoronaModel.fromJson(Map<String, dynamic> json) => CoronaModel(
    id: json["ID"] == null ? null : json["ID"],
    country: json["Country"] == null ? null : json["Country"],
    countryCode: json["CountryCode"] == null ? null : json["CountryCode"],
    province: json["Province"] == null ? null : json["Province"],
    city: json["City"] == null ? null : json["City"],
    cityCode: json["CityCode"] == null ? null : json["CityCode"],
    lat: json["Lat"] == null ? null : json["Lat"],
    lon: json["Lon"] == null ? null : json["Lon"],
    confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
    deaths: json["Deaths"] == null ? null : json["Deaths"],
    recovered: json["Recovered"] == null ? null : json["Recovered"],
    active: json["Active"] == null ? null : json["Active"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "Country": country == null ? null : country,
    "CountryCode": countryCode == null ? null : countryCode,
    "Province": province == null ? null : province,
    "City": city == null ? null : city,
    "CityCode": cityCode == null ? null : cityCode,
    "Lat": lat == null ? null : lat,
    "Lon": lon == null ? null : lon,
    "Confirmed": confirmed == null ? null : confirmed,
    "Deaths": deaths == null ? null : deaths,
    "Recovered": recovered == null ? null : recovered,
    "Active": active == null ? null : active,
    "Date": date == null ? null : date!.toIso8601String(),
  };
}
