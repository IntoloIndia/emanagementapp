// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    CustomerModel({
        this.customers,
        this.count,
    });

    List<Customer>? customers;
    int? count;

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "customers": List<dynamic>.from(customers!.map((x) => x.toJson())),
        "count": count,
    };
}

class Customer {
    Customer({

        this.id,
        this.customerName,
        this.mobileNo,
    });

    int? id;
    String? customerName;
    String? mobileNo;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        customerName: json["customer_name"],
        mobileNo: json["mobile_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "mobile_no": mobileNo,
    };
}
