import 'package:flutter/material.dart';
import 'package:hawkers/Models/communityModel.dart';
import 'package:hawkers/Services/api.dart';

class Community with ChangeNotifier {
  RestApi restApi = RestApi();
  Community();

  List<CommunityResponse> _communityResponse = [];

  List<CommunityResponse> get communityResponse {
    return _communityResponse;
  }

  Future<List<CommunityResponse>> addCommunity(String body) async {
    final response = await restApi.addCommunity(body);
    List<CommunityResponse> communityResponse = communityResponseFromJson(response.body);
    _communityResponse = communityResponse;
    notifyListeners();
    return communityResponse;
  }
}