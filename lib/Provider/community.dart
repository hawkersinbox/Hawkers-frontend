import 'package:flutter/material.dart';
import 'package:hawkers/Models/communityModel.dart';
import 'package:hawkers/Services/api.dart';

class CommunityProvider with ChangeNotifier {
  RestApi restApi = RestApi();
  CommunityProvider();

  List<Community> _community = [];

  List<Community> get community {
    return _community;
  }

  Future<List<Community>> getCommunity(String access_token) async {
    final response = await restApi.getCommunity();
    List<Community> community =
        communityResponseFromJson(response.body).response;
    _community = community;
    notifyListeners();
    return _community;
  }
}
