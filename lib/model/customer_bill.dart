// To parse this JSON data, do
//
//     final billModel = billModelFromJson(jsonString);

import 'dart:convert';

BillModel billModelFromJson(String str) => BillModel.fromJson(json.decode(str));

String billModelToJson(BillModel data) => json.encode(data.toJson());

class BillModel {
    BillModel({
        this.customerBills,
        this.count,
    });

    List<CustomerBill>? customerBills;
    int? count;

    factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        customerBills: List<CustomerBill>.from(json["customer_bills"].map((x) => CustomerBill.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "customer_bills": List<dynamic>.from(customerBills!.map((x) => x.toJson())),
        "count": count,
    };
}

class CustomerBill {
    CustomerBill({
        this.id,
        this.customerId,
        this.billDate,
        this.billTime,
        this.invoiceNo,
        this.totalAmount,
        this.earnedPoint,
        this.redeemPoint,
    });

    int? id;
    int? customerId;
    String? billDate;
    String? billTime;
    int? invoiceNo;
    int? totalAmount;
    double? earnedPoint;
    int? redeemPoint;

    factory CustomerBill.fromJson(Map<String, dynamic> json) => CustomerBill(
        id: json["id"],
        customerId: json["customer_id"],
        billDate: json["bill_date"],
        billTime: json["bill_time"],
        invoiceNo: json["invoice_no"],
        totalAmount: json["total_amount"],
        earnedPoint: json["earned_point"].toDouble(),
        redeemPoint: json["redeem_point"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "bill_date": billDate,
        "bill_time": billTime,
        "invoice_no": invoiceNo,
        "total_amount": totalAmount,
        "earned_point": earnedPoint,
        "redeem_point": redeemPoint,
    };
}
