// To parse this JSON data, do
//
//     final allPropetyResponse = allPropetyResponseFromJson(jsonString);

import 'dart:convert';

AllPropetyResponse allPropetyResponseFromJson(String str) =>
    AllPropetyResponse.fromJson(json.decode(str));

String allPropetyResponseToJson(AllPropetyResponse data) =>
    json.encode(data.toJson());

class AllPropetyResponse {
  num? statusCode;
  bool? success;
  String? message;
  Data? data;
  Stats? stats;

  AllPropetyResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
    this.stats,
  });

  factory AllPropetyResponse.fromJson(Map<String, dynamic> json) =>
      AllPropetyResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "stats": stats?.toJson(),
  };
}

class Data {
  Meta? meta;
  List<AllPropertyResult>? data;

  Data({this.meta, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    data: json["data"] == null
        ? []
        : List<AllPropertyResult>.from(json["data"]!.map((x) => AllPropertyResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AllPropertyResult {
  num? id;
  num? price;
  String? address;
  num? beds;
  num? baths;
  String? propertyType;
  String? imageUrl;
  bool? isSaved;
  double? roi;
  GrowthRate? growthRate;

  AllPropertyResult({
    this.id,
    this.price,
    this.address,
    this.beds,
    this.baths,
    this.propertyType,
    this.imageUrl,
    this.isSaved,
    this.roi,
    this.growthRate,
  });

  factory AllPropertyResult.fromJson(Map<String, dynamic> json) => AllPropertyResult(
    id: json["id"],
    price: json["price"],
    address: json["address"],
    beds: json["beds"],
    baths: json["baths"],
    propertyType: json["property_type"],
    imageUrl: json["image_url"],
    isSaved: json["is_saved"],
    roi: json["roi"]?.toDouble(),
    growthRate: json["growth_rate"] == null
        ? null
        : GrowthRate.fromJson(json["growth_rate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "address": address,
    "beds": beds,
    "baths": baths,
    "property_type": propertyType,
    "image_url": imageUrl,
    "is_saved": isSaved,
    "roi": roi,
    "growth_rate": growthRate?.toJson(),
  };
}

class GrowthRate {
  double? year1;
  double? year5;
  double? year10;

  GrowthRate({this.year1, this.year5, this.year10});

  factory GrowthRate.fromJson(Map<String, dynamic> json) => GrowthRate(
    year1: json["year_1"]?.toDouble(),
    year5: json["year_5"]?.toDouble(),
    year10: json["year_10"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "year_1": year1,
    "year_5": year5,
    "year_10": year10,
  };
}

class Meta {
  num? page;
  num? limit;
  num? total;

  Meta({this.page, this.limit, this.total});

  factory Meta.fromJson(Map<String, dynamic> json) =>
      Meta(page: json["page"], limit: json["limit"], total: json["total"]);

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
  };
}

class Stats {
  Stats();

  factory Stats.fromJson(Map<String, dynamic> json) => Stats();

  Map<String, dynamic> toJson() => {};
}
