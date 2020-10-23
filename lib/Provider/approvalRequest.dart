import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hawkers/Models/salesRequestModel.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/equal_ignore_case.dart';

class AprovalSales with ChangeNotifier {
  AprovalSales();
  RestApi restApi = RestApi();
  String _query = '';
  String get query => _query;
  setQuery(val) {
    _query = val;
  }

  List<SalesRequest> _allSalesRequest = [];
  List<SalesRequest> get allSalesRequest => _allSalesRequest;

  List<SalesRequest> _inprogressSalesRequest = [];
  List<SalesRequest> get inprogressSalesRequest => _inprogressSalesRequest;

  List<SalesRequest> _completedSalesRequest = [];
  List<SalesRequest> get completedSalesRequest => _completedSalesRequest;

  List<SalesRequest> _displayAllSalesRequest = [];
  List<SalesRequest> get displayAllSalesRequest => _displayAllSalesRequest;

  List<SalesRequest> _displayInprogressSalesRequest = [];
  List<SalesRequest> get displayInprogressSalesRequest =>
      _displayInprogressSalesRequest;

  List<SalesRequest> _displayCompletedSalesRequest = [];
  List<SalesRequest> get displayCompletedSalesRequest =>
      _displayCompletedSalesRequest;

  getInitial() {
    getAllApprovalRequest();
    getInprogressApprovalRequest();
    getCompletedApprovalRequest();
  }

  search() {
    _displayAllSalesRequest = _allSalesRequest
        .where((element) => equalsIgnoreCase(element.id.toString(), query))
        .toList();
    _displayInprogressSalesRequest = _inprogressSalesRequest
        .where((element) => equalsIgnoreCase(element.id.toString(), query))
        .toList();
    _displayCompletedSalesRequest = _completedSalesRequest
        .where((element) => equalsIgnoreCase(element.id.toString(), query))
        .toList();
    notifyListeners();
  }

  Future<void> getAllApprovalRequest() async {
    final response = await restApi.salesRequest();
    final responseMap = jsonDecode(response.body);
    if (responseMap["success"]) {
      _allSalesRequest = salesRequestResponseFromJson(response.body).response;
    }
    search();
    notifyListeners();
  }

  Future<void> getInprogressApprovalRequest() async {
    final response = await restApi.salesRequestbystage('Inprogress');
    final responseMap = jsonDecode(response.body);
    if (responseMap["success"]) {
      _inprogressSalesRequest =
          salesRequestResponseFromJson(response.body).response;
    }
    search();
    notifyListeners();
  }

  Future<void> getCompletedApprovalRequest() async {
    final response = await restApi.salesRequestbystage('Approved');
    final responseMap = jsonDecode(response.body);
    if (responseMap["success"]) {
      _completedSalesRequest =
          salesRequestResponseFromJson(response.body).response;
    }
    search();

    notifyListeners();
  }
}
