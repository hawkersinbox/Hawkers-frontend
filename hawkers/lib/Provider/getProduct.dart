import 'package:flutter/material.dart';
import 'package:hawkers/Models/Product.dart' ;
import 'package:hawkers/Services/api.dart';

class GetProduct with ChangeNotifier {
  RestApi restApi = RestApi();

  GetProduct();

  List<Products> _products = [];

  List<Products> get products {
    return _products;
  }

  Future<List<Products>> getProduct(String string) async {
    final response = await restApi.getProduct();
    List<Products> products = productsFromJson(response.body);
    _products = products;
    return products;
  }
}