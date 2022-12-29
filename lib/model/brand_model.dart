// To parse this JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'dart:convert';

BrandsModel brandsModelFromJson(String str) => BrandsModel.fromJson(json.decode(str));

String brandsModelToJson(BrandsModel data) => json.encode(data.toJson());

class BrandsModel {
    BrandsModel({
        this.data,
    });

    List<BrandData>? data;

    factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
        data: List<BrandData>.from(json["data"].map((x) => BrandData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class BrandData {
    BrandData({
        this.id,
        this.brandName,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? brandName;
    String? createdAt;
    String? updatedAt;

    factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
        id: json["id"],
        brandName: json["brand_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand_name": brandName,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
