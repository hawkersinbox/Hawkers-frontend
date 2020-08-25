import 'package:flutter/material.dart';
import 'package:hawkers/Models/communityModel.dart' ;
import 'package:hawkers/Services/api.dart';

class GetCommunity with ChangeNotifier {
  RestApi restApi = RestApi();
  GetCommunity();

  List<CommunityResponse> _communityResponse = [];

  List<CommunityResponse> get communityResponse {
    return _communityResponse;
  }

  Future<List<CommunityResponse>> getCommunity(String string) async {
    final response = await restApi.getCommunity();
    List<CommunityResponse> communityResponse = communityResponseFromJson(response.body);
    _communityResponse = communityResponse;
    notifyListeners();
    return communityResponse;
  }
}