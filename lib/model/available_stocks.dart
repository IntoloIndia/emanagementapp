// To parse this JSON data, do
//
//     final availableStocks = availableStocksFromJson(jsonString);

import 'dart:convert';

AvailableStocks availableStocksFromJson(String str) =>
    AvailableStocks.fromJson(json.decode(str));

String availableStocksToJson(AvailableStocks data) =>
    json.encode(data.toJson());

class AvailableStocks {
  AvailableStocks({
    this.data,
  });

  List<Datum>? data;

  factory AvailableStocks.fromJson(Map<String, dynamic> json) =>
      AvailableStocks(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.productCode,
    this.categoryId,
    this.subCategoryId,
    this.product,
    this.price,
    this.size,
    this.color,
    this.barcode,
    this.category,
    this.subCategory,
  });

  int? id;
  String? productCode;
  String? categoryId;
  String? subCategoryId;
  String? product;
  String? price;
  String? size;
  String? color;
  String? barcode;
  String? category;
  String? subCategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productCode: json["product_code"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        product: json["product"],
        price: json["price"],
        size: json["size"],
        color: json["color"],
        barcode: json["barcode"] == null ? null : json["barcode"],
        category: json["category"],
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_code": productCode,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "product": product,
        "price": price,
        "size": size,
        "color": color,
        "barcode": barcode == null ? null : barcode,
        "category": category,
        "sub_category": subCategory,
      };
}
