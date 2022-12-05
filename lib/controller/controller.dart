import 'dart:math';

import 'package:emanagementapp/model/available_stocks.dart';
import 'package:emanagementapp/model/category.dart';
import 'package:emanagementapp/model/color_model.dart';
import 'package:emanagementapp/model/model.dart';
import 'package:emanagementapp/model/size_model.dart';
import 'package:emanagementapp/model/today_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Controller with ChangeNotifier {
  int selectedIndex = 0;
  UserModel userData = UserModel();
  AvailableStocks availableStocks = AvailableStocks();
  Category category = Category();
  SubCategory subCategory = SubCategory();
  TodaySalesModel todaySales = TodaySalesModel();
  ColorModel colorModel = ColorModel();
  SizeModel sizeModel = SizeModel();
  String cateEndPoint = "available-stock";
  
  List<String> selectedItems = [];
  String selectedCategory = "CATEGOFY";
  String selectedSubCategory = "SUB-CATEGORY";
  String selectedPeople = "SALES BY";
  String selectedColor = "COLOR";
  String selectedSize = "SIZE";

    void itemChanges(bool isSelected, String itemValue) {  
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    notifyListeners();
  }

  Future<void> getUserData() async {
    print('${dotenv.env["APP_URL"]}users');
    final response = await http.get(Uri.parse('${dotenv.env["APP_URL"]}users'));

    if (response.statusCode == 200) {
      userData = userModelFromJson(response.body);
      // print("userData.userCount");
      // print(userData.userCount);
      notifyListeners();
    } else {}
  }

  Future<void> getTodaySales() async {
    print('${dotenv.env["APP_URL"]}users');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}sales-invoice'));

    if (response.statusCode == 200) {
      todaySales = todaySalesModelFromJson(response.body);
      // print("userData.userCount");
      // print(userData.userCount);
      notifyListeners();
    } else {}
  }

  Future<void> availableStocksData(String endPoint) async {
    print('${dotenv.env["APP_URL"]}$endPoint');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}$endPoint'));

    if (response.statusCode == 200) {
      availableStocks = availableStocksFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getCategoryData() async {
    print('${dotenv.env["APP_URL"]}get-category');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-category'));
    if (response.statusCode == 200) {
      category = categoryFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getSubCategory() async {
    print('${dotenv.env["APP_URL"]}get-sub-category/2');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-sub-category/2'));
    if (response.statusCode == 200) {
      subCategory = subCategoryFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getColorCategory() async {
    // print('${dotenv.env["APP_URL"]}get-sub-category/2');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-color'));
    if (response.statusCode == 200) {
      colorModel = sizeModelFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getSizeCategory() async {
    // print('${dotenv.env["APP_URL"]}get-sub-category/2');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-size'));
    if (response.statusCode == 200) {
      sizeModel = colorModelFromJson(response.body);
      notifyListeners();
    } else {}
  }

  void cateEndPointCahnge(String end) {
    getCategoryData();

    for (int i = 0; i < category.data!.length; i++) {
      if (end == category.data![i].category) {
        cateEndPoint =
            "filter-available-stock/" + category.data![i].id.toString();
        print(cateEndPoint);
        break;
      }
    }
    notifyListeners();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // void itemChanges(bool isSelected, String itemValue) {
  //   if (isSelected) {
  //     selectedItems.add(itemValue);
  //   } else {
  //     selectedItems.remove(itemValue);
  //   }
  //   notifyListeners();
  // }

  void cancel() {
    // Navigator.pop(context);
  }

  void submit() {
    // Navigator.pop(context, selectedItems);
  }

  void clear() {
    //  selectedItems = [];
    // Navigator.pop(context, selectedItems);
    notifyListeners();
  }

  Container CategoryFunction(List items, BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ListBody(
          children: items
              .map(
                (item) => CheckboxListTile(
                  value: selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => itemChanges(isChecked!, item),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
