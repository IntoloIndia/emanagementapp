import 'dart:convert';

import 'package:emanagementapp/controller/geting_data_from_api.dart';
import 'package:emanagementapp/model/customer_bill.dart';
import 'package:emanagementapp/view/customer_bills.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:emanagementapp/model/customer_model.dart';
import 'package:flutter/cupertino.dart';

class ApiController extends ChangeNotifier {
  CustomerModel _customer = CustomerModel();

  bool customerLoading = false;
  bool billLoading = false;

  BillModel _bill = BillModel();

  CustomerModel get customer => _customer;
  BillModel get bill => _bill;

  // ignore: non_constant_identifier_names
  Future<void> CustomerList() async {
    notifyListeners();
    final response = await ApiServices().getAllCustomers();

    print(response);
    _customer = response;
    customerLoading = true;
    notifyListeners();
  }

  Future<void> billList(int endPonit) async {
    final response = await ApiServices().customerBills(endPonit);

    print(" response ============================");

    print(response);
    _bill = response;
    billLoading = true;
    notifyListeners();
  }
}
