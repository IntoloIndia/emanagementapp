import 'package:emanagementapp/model/available_stocks.dart';
import 'package:emanagementapp/model/category.dart';
import 'package:emanagementapp/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Controller with ChangeNotifier {
  int selectedIndex = 0;
  UserModel userData = UserModel();
  AvailableStocks availableStocks = AvailableStocks();
  Category category = Category();
  SubCategory subCategory = SubCategory();

  Future<void> getUserData() async {
    print('${dotenv.env["API"]}users');
    final response = await http.get(Uri.parse('${dotenv.env["API"]}users'));

    if (response.statusCode == 200) {
      userData = userModelFromJson(response.body);
      // print("userData.userCount");
      // print(userData.userCount);
      notifyListeners();
    } else {}
  }

  Future<void> availableStocksData() async {
    print('${dotenv.env["API"]}get-product');
    final response =
        await http.get(Uri.parse('${dotenv.env["API"]}get-product'));

    if (response.statusCode == 200) {
      availableStocks = availableStocksFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getCategoryData() async {
    print('${dotenv.env["API"]}get-category');
    final response =
        await http.get(Uri.parse('${dotenv.env["API"]}get-category'));
    if (response.statusCode == 200) {
      category = categoryFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getSubCategory() async {
    print('${dotenv.env["API"]}get-sub-category/2');
    final response =
        await http.get(Uri.parse('${dotenv.env["API"]}get-sub-category/2'));
    if (response.statusCode == 200) {
      subCategory = subCategoryFromJson(response.body);
      notifyListeners();
    } else {}
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

}
