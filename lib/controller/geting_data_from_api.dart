import 'package:emanagementapp/model/customer_bill.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/customer_model.dart';

class ApiServices {
  Future<CustomerModel> getAllCustomers() async {
    CustomerModel customer = CustomerModel();
    print("${dotenv.env}customer");
    final response = await http
        .get(Uri.parse("http://192.168.0.99:8080/emanagementweb/api/customer"));

    print(response.body);

    if (response.statusCode == 200) {
      customer = customerModelFromJson(response.body);
    }
    print("response.body=========================");
    print(customer);
    return customer;
  }

  Future<BillModel> customerBills(int endPonit) async {
    print("abasdfasdfasd");
    BillModel bill = BillModel();

    print(endPonit);
    final response = await http.get(Uri.parse(
        "http://192.168.0.99:8080/emanagementweb/api/customer-bill/${endPonit}"));

    if (response.statusCode == 200) {
      bill = billModelFromJson(response.body);
    }
    return bill;
  }
}
