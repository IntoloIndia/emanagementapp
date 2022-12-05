// To parse this JSON data, do
//
//     final sizeModel = sizeModelFromJson(jsonString);

import 'dart:convert';

import 'package:emanagementapp/model/size_model.dart';

ColorModel sizeModelFromJson(String str) => ColorModel.fromJson(json.decode(str));

String sizeModelToJson(ColorModel data) => json.encode(data.toJson());

class ColorModel {
    ColorModel({
        this.data,
    });
    
    List<SizeData>? data;

    factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        data: List<SizeData>.from(json["data"].map((x) => SizeData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class SizeData {
    SizeData(
      {
       this.id,
       this.color,
      }
    );

    int? id;
    String? color;

    factory SizeData.fromJson(Map<String, dynamic> json) => SizeData(
        id: json["id"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
    };
}
