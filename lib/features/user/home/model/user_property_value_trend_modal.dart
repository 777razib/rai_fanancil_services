// To parse this JSON data, do
//
//     final userPropertyValueResponse = userPropertyValueResponseFromJson(jsonString);

import 'dart:convert';

UserPropertyValueResponse userPropertyValueResponseFromJson(String str) =>
    UserPropertyValueResponse.fromJson(json.decode(str));

String userPropertyValueResponseToJson(UserPropertyValueResponse data) =>
    json.encode(data.toJson());

class UserPropertyValueResponse {
  int? statusCode;
  bool? success;
  String? message;
  List<Datum>? data;
  Stats? stats;

  UserPropertyValueResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
    this.stats,
  });

  factory UserPropertyValueResponse.fromJson(Map<String, dynamic> json) =>
      UserPropertyValueResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "stats": stats?.toJson(),
  };
}

class Datum {
  String? date;
  int? propertyValue;

  Datum({this.date, this.propertyValue});

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(date: json["date"], propertyValue: json["propertyValue"]);

  Map<String, dynamic> toJson() => {
    "date": date,
    "propertyValue": propertyValue,
  };
}

class Stats {
  Stats();

  factory Stats.fromJson(Map<String, dynamic> json) => Stats();

  Map<String, dynamic> toJson() => {};
}
