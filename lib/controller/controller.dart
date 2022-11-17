import 'package:emanagementapp/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Controller with ChangeNotifier {
  int selectedIndex = 0;
  List<UserModel> userData = [];

  Future<List<UserModel>> getUserData() async {
    final response = await http
        .get(Uri.parse('http://192.168.0.99:8080/emanagementweb/api/users'));

    if (response.statusCode == 200) {
      notifyListeners();
      return userData = userModelFromJson(response.body) as List<UserModel>;
    } else {
      notifyListeners();
      return userData;
    }
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
