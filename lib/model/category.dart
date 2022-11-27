// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.data,
  });

  List<Datum>? data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.category,
    this.categoryImg,
  });

  int? id;
  String? category;
  String? categoryImg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        categoryImg: json["category_img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "category_img": categoryImg,
      };
}

// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);

SubCategory subCategoryFromJson(String str) =>
    SubCategory.fromJson(json.decode(str));

String subCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  SubCategory({
    this.data,
  });

  List<Sub>? data;
  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        data: List<Sub>.from(json["data"].map((x) => Sub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Sub {
  Sub(
    {
    this.id,
    this.categoryId,
    this.subCategory,
    this.subCategoryImg,
    this.createdAt,
    this.updatedAt,
  }
  );

  int? id;
  String? categoryId;
  String? subCategory;
  String? subCategoryImg;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
        id: json["id"],
        categoryId: json["category_id"],
        subCategory: json["sub_category"],
        subCategoryImg: json["sub_category_img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "sub_category": subCategory,
        "sub_category_img": subCategoryImg,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
