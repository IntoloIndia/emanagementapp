// To parse this JSON data, do
//
//     final todaySalesModel = todaySalesModelFromJson(jsonString);

import 'dart:convert';

TodaySalesModel todaySalesModelFromJson(String str) =>
    TodaySalesModel.fromJson(json.decode(str));

String todaySalesModelToJson(TodaySalesModel data) =>
    json.encode(data.toJson());

class TodaySalesModel {
  TodaySalesModel({
    this.data,
  });

  List<Datum>? data;

  factory TodaySalesModel.fromJson(Map<String, dynamic> json) =>
      TodaySalesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.customerId,
    this.productCode,
    this.productId,
    this.qty,
    this.sizeId,
    this.price,
    this.amount,
    this.date,
    this.time,
    this.status,
    this.product,
  });

  int? id;
  int? customerId;
  int? productCode;
  int? productId;
  int? qty;
  int? sizeId;
  String? price;
  int? amount;
  String? date;
  String? time;
  int? status;
  String? product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customerId: json["customer_id"],
        productCode: json["product_code"],
        productId: json["product_id"],
        qty: json["qty"],
        sizeId: json["size_id"],
        price: json["price"],
        amount: json["amount"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "product_code": productCode,
        "product_id": productId,
        "qty": qty,
        "size_id": sizeId,
        "price": price,
        "amount": amount,
        "date": date,
        "time": time,
        "status": status,
        "product": product!.toString(),
      };
}
