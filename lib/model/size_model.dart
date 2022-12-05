// To parse this JSON data, do
//
//     final colorModel = colorModelFromJson(jsonString);

import 'dart:convert';

SizeModel colorModelFromJson(String str) =>
    SizeModel.fromJson(json.decode(str));

String colorModelToJson(SizeModel data) => json.encode(data.toJson());

class SizeModel {
  SizeModel({
    this.data,
  });

  List<ColorData>? data;

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
        data: List<ColorData>.from(
            json["data"].map((x) => ColorData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ColorData {
  ColorData({
    this.id,
    this.size,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? size;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory ColorData.fromJson(Map<String, dynamic> json) => ColorData(
        id: json["id"],
        size: json["size"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
