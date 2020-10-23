import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hawkers/Models/communityModel.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/equal_ignore_case.dart';

class AprovalCommunity with ChangeNotifier {
  AprovalCommunity();
  RestApi restApi = RestApi();

  String _query = '';
  String get query => _query;
  setQuery(val) {
    _query = val;
  }

  List<Community> _allCommunity = [];
  List<Community> get allCommunity => _allCommunity;

  List<Community> _inprogressCommunity = [];
  List<Community> get inprogressCommunity => _inprogressCommunity;

  List<Community> _completedCommunity = [];
  List<Community> get completedCommunity => _completedCommunity;

  List<Community> _displayAllCommunity = [];
  List<Community> get displayAllCommunity => _displayAllCommunity;

  List<Community> _displayInprogressCommunity = [];
  List<Community> get displayInprogressCommunity => _displayInprogressCommunity;

  List<Community> _displayCompletedCommunity = [];
  List<Community> get displayCompletedCommunity => _displayCompletedCommunity;

  getInitial() {
    getAllApprovalCommunity();
    getInprogressApprovalCommunity();
    getCompletedApprovalCommunity();
  }

  search() {
    _displayAllCommunity = _allCommunity
        .where((element) => equalsIgnoreCase(element.id.toString(), query))
        .toList();
    _displayInprogressCommunity = _inprogressCommunity
        .where((element) => equalsIgnoreCase(element.id.toString(), query))
        .toList();
    _displayCompletedCommunity = _completedCommunity
        .where((element) => equalsIgnoreCase(element.id.toString(), query))
        .toList();
    notifyListeners();
  }

  Future<void> getAllApprovalCommunity() async {
    final response = await restApi.getCommunity();
    final responseMap = jsonDecode(response.body);
    if (responseMap["success"]) {
      _allCommunity = communityResponseFromJson(response.body).response;
    }

    search();
    notifyListeners();
  }

  Future<void> getInprogressApprovalCommunity() async {
    final response = await restApi.getCommunityByStage('Inprogress');
    final responseMap = jsonDecode(response.body);
    if (responseMap["success"]) {
      _inprogressCommunity = communityResponseFromJson(response.body).response;
    }
    search();
    notifyListeners();
  }

  Future<void> getCompletedApprovalCommunity() async {
    final response = await restApi.getCommunityByStage('Approved');
    final responseMap = jsonDecode(response.body);
    if (responseMap["success"]) {
      _completedCommunity = communityResponseFromJson(response.body).response;
    }
    search();

    notifyListeners();
  }
}
