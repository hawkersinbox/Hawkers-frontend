import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/Product.dart' as ProductModel;
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/userData.dart';


class Product with ChangeNotifier {
  RestApi restApi = RestApi();

  Product();

  List<ProductModel.Products> _products = [];

  List<ProductModel.Products> get products {
    return _products;
  }

  Future<List<ProductModel.Products>>product(String body) async {
    final response = await restApi.product(body);
    List<ProductModel.Products> products = ProductModel.productsFromJson( response.body);
    _products = products;
    notifyListeners();
    return products;
  }
}