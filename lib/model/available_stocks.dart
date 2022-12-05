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
    this.count,
  });

  List<Datum>? data;
  int? count;

  factory AvailableStocks.fromJson(Map<String, dynamic> json) =>
      AvailableStocks(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
      };
}

class Datum {
  Datum({
     this.id,
        this.productCode,
        this.product,
        this.salesPrice,
        this.size,
        this.color,
        this.category,
        this.subCategory,
  }
);

    int? id;
    String? productCode;
    String? product;
    String? salesPrice;
    String? size;
    String? color;
    String? category;
    String? subCategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
       id: json["id"],
        productCode: json["product_code"],
        product: json["product"],
        salesPrice: json["sales_price"],
        size: json["size"],
        color: json["color"],
        category: json["category"],
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_code": productCode,
        "product": product,
        "sales_price": salesPrice,
        "size": size,
        "color": color,
        "category": category,
        "sub_category": subCategory,
      };
}
