import 'dart:convert';
import 'dart:math';

import 'package:emanagementapp/model/brand_model.dart';
import 'package:emanagementapp/model/category.dart';
import 'package:emanagementapp/model/color_model.dart';

import 'package:emanagementapp/model/size_model.dart';
import 'package:emanagementapp/model/today_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

List availableSubCategory = [];

class FilterController extends ChangeNotifier {
  String avialableCategory = "CATEGOFY";
  String avialableSubCategory = "SUB-CATEGORY";
  String avialableColor = "COLOR";
  String avialableSize = "SIZE";

  Category category = Category();
  SubCategory subCategory = SubCategory();
  TodaySalesModel todaySales = TodaySalesModel();
  ColorModel colorModel = ColorModel();
  SizeModel sizeModel = SizeModel();
  BrandsModel brandsModel = BrandsModel();

  int availableSubCategoryId = 0;

  List ListAvailableCategory = [];
  List ListAvailableSubCategory = [];
  List ListAvailableColor = [];
  List ListAvailableSize = [];

  Future<void> getListAvailableCategory() async {
    final response =
        await http.get(Uri.parse("${dotenv.env["APP_URL"]}get-category"));
    if (response.statusCode == 200) {
      // final jsonResponse = jsonDecode(response.body);
      final ApiData = categoryFromJson(response.body);

      for (int i = 0; i < ApiData.data!.length; i++) {
        if (ListAvailableCategory.contains(ApiData.data![i].category) ==
            false) {
          ListAvailableCategory.add(ApiData.data![i].category);
        }
      }

      print(ListAvailableCategory);

      notifyListeners();
    } else {}
  }

  // Future<void> getListAvailableSubCategory() async {
  //   else{
  // }
  // }

  

  Future<void> getListAvailableColor() async {
    final response =
        await http.get(Uri.parse("${dotenv.env["APP_URL"]}get-color"));
    if (response.statusCode == 200) {
      // final jsonResponse = jsonDecode(response.body);
      final ApiData = colorModelFromJson(response.body);

      for (int i = 0; i < ApiData.data!.length; i++) {
        if (ListAvailableColor.contains(ApiData.data![i].color) == false) {
          ListAvailableColor.add(ApiData.data![i].color);
        }
      }
      print(ListAvailableColor);
      notifyListeners();
    } else {}
  }

  Future<void> getListAvailableSize() async {
    final response =
        await http.get(Uri.parse("${dotenv.env["APP_URL"]}get-size"));
    if (response.statusCode == 200) {
      // final jsonResponse = jsonDecode(response.body);
      final ApiData = sizeModelFromJson(response.body);

      for (int i = 0; i < ApiData.data!.length; i++) {
        if (ListAvailableSize.contains(ApiData.data![i].size) == false) {
          ListAvailableSize.add(ApiData.data![i].size);
        }
      }
      print(ListAvailableCategory);
      notifyListeners();
    } else {}
  }

  void CategoryList() {}
}
