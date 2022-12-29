import 'dart:convert';

import 'package:emanagementapp/model/available_stocks.dart';
import 'package:emanagementapp/model/brand_model.dart';
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
  BrandsModel brandsModel = BrandsModel();

  List<String> selectedItems = [];
  String selectedCategory = "CATEGOFY";
  String selectedSubCategory = "SUB-CATEGORY";
  String selectedColor = "COLOR";
  String selectedSize = "SIZE";

  int categoryEndPoint = 0;
  int subCategoryEndPoint = 0;
  String sizeEndPoint = "";
  String colorEndPoint = "";
  int brandEndPoint = 0;

  int subCategoryId = 0;

  void itemChanges(bool isSelected, String itemValue) {
    if (isSelected) {
      selectedItems.add(itemValue);
    } else {
      selectedItems.remove(itemValue);
    }
    notifyListeners();
  }

  String setCategory(String cate) {
    selectedCategory = cate;
    notifyListeners();
    return cate;
  }

  void setSub(String it) {
    for (int i = 0; i < category.data!.length; i++) {
      print(i);
      if (it == category.data![i].category) {
        subCategoryId = category.data![i].id!;
        getSubCategory();
        print("subCategoryId ==");
        print(subCategoryId);
        print(subCategory.data![i].subCategory);
        notifyListeners();
      }
    }
  }

  Future<void> getBrand() async {
    print('${dotenv.env["APP_URL"]}get-brand');
    print("get brand function");
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-brand'));

    if (response.statusCode == 200) {
      brandsModel = brandsModelFromJson(response.body);
      print("brandsModel ++");
      print(brandsModel);
      print(brandsModel.data!.length);
      notifyListeners();
    } else {}
  }

  void setValuesEmpty() {
    categoryEndPoint = 0;
    subCategoryEndPoint = 0;
    sizeEndPoint = "";
    colorEndPoint = "";
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
      notifyListeners();
    } else {}
  }

  Future<void> availableStocksData() async {
    print('${dotenv.env["APP_URL"]}available-stock');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}available-stock'));

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
    final response = await http.get(
        Uri.parse('${dotenv.env["APP_URL"]}get-sub-category/$subCategoryId'));
    if (response.statusCode == 200) {
      subCategory = subCategoryFromJson(response.body);
      notifyListeners();
    } else {}
  }

  void submit(BuildContext context) {
    // availableStocksData();
    Navigator.pop(context, selectedItems);
  }

  Future<void> getColorCategory() async {
    // print('${dotenv.env["APP_URL"]}get-sub-category/2');

    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-color'));
    if (response.statusCode == 200) {
      colorModel = colorModelFromJson(response.body);
      notifyListeners();
    } else {}
  }

  Future<void> getSizeCategory() async {
    // print('${dotenv.env["APP_URL"]}get-sub-category/2');
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-size'));
    if (response.statusCode == 200) {
      sizeModel = sizeModelFromJson(response.body);
      notifyListeners();
    } else {
      
    }
  }

  void cateEndPointCahnge(String end) {
    getCategoryData();
    print("object is running");
    for (int i = 0; i < category.data!.length; i++) {
      if (end == category.data![i].category) {
        categoryEndPoint = int.parse(category.data![i].id.toString());
        print("categoryEndPoint === ");
        print(categoryEndPoint);
        break;
      }
    }
    notifyListeners();
  }

  void subCateEndPointCahnge(String end) {
    getSubCategory();
    for (int i = 0; i < subCategory.data!.length; i++) {
      if (end == subCategory.data![i].subCategory) {
        subCategoryEndPoint =
            int.parse(subCategory.data![i].categoryId.toString());
        print(" subCategoryEndPoint == ");
        print(subCategoryEndPoint);
        break;
      }
    }

    notifyListeners();
  }

  void brandCateEndPointCahnge(String end) async {
    print('${dotenv.env["APP_URL"]}get-brand');
    print("get brand function");
    final response =
        await http.get(Uri.parse('${dotenv.env["APP_URL"]}get-brand'));

    if (response.statusCode == 200) {
      brandsModel = brandsModelFromJson(response.body);
      print("brandsModel ++");
      print(brandsModel);
      print(brandsModel.data!.length);
      notifyListeners();
    }

    for (int i = 0; i < brandsModel.data!.length; i++) {
      print(brandsModel);

      if (end == brandsModel.data![i].brandName) {
        print("brandsModel == ");
        brandEndPoint = int.parse(brandsModel.data![i].id.toString());
        print(" brandEndPoint == ");
        print(brandEndPoint);
        break;
      }
    }

    notifyListeners();
  }

  void ColorCateEndPointCahnge(String end) {
    getColorCategory();
    for (int i = 0; i < colorModel.data!.length; i++) {
      if (end == colorModel.data![i].color) {
        colorEndPoint = colorModel.data![i].color.toString();
        print("colorEndPoint == ");
        print(colorEndPoint);
        break;
      }
    }
    notifyListeners();
  }

  void SizeCateEndPointCahnge(String end) {
    getSizeCategory();
    for (int i = 0; i < sizeModel.data!.length; i++) {
      if (end == sizeModel.data![i].size) {
        sizeEndPoint = sizeModel.data![i].size.toString();
        print("sizeEndPoint == ");
        print(sizeEndPoint);
        break;
      }
    }
    
    notifyListeners();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> filterData() async {
    var data = {
      "category_id": categoryEndPoint,
      "sub_category_id": subCategoryEndPoint,
      "size": sizeEndPoint,
      "color": colorEndPoint,
    };
    try {
      final response = await http.post(
          Uri.parse('${dotenv.env["APP_URL"]}filter-available-stock'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      print(response.body);
      // print(response.body);
      print(jsonEncode(data));

      availableStocks = availableStocksFromJson(response.body);

      notifyListeners();
    } catch (e) {}
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

  // void submit() {
  //   // Navigator.pop(context, selectedItems);
  // }

  void clear() {
    //  selectedItems = [];
    //  Navigator.pop( context, selectedItems);
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
