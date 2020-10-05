import 'dart:convert';

import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/userModel.dart' as UserModel;
import 'package:shared_preferences/shared_preferences.dart';

class User with ChangeNotifier {
  RestApi restApi = RestApi();

  User();

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    try {
      UserData.user =
          UserModel.User.fromJson(json.decode(prefs.getString('userData')));
      notifyListeners();
    } catch (e) {
      print(e);
      throw (e);
    }
    return true;
  }
}
