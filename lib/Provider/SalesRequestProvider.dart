import 'package:flutter/material.dart';
import 'package:hawkers/Models/salesRequestModel.dart';
import 'package:hawkers/Services/api.dart';

class SalesRequestProvider with ChangeNotifier {
  RestApi restApi = RestApi();

  List<SalesRequest> _salesRequests = [];

  List<SalesRequest> get salesRequests {
    return _salesRequests;
  }

  Future<void> getSalesRequest() async {
    final response = await restApi.salesRequest();
    List<SalesRequest> salesRequests =
        salesRequestResponseFromJson(response.body).response;
    _salesRequests = salesRequests;
    notifyListeners();
    return;
  }
}
