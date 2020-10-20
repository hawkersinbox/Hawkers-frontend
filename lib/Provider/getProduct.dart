import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hawkers/Models/Product.dart';
import 'package:hawkers/Models/category.dart';
import 'package:hawkers/Models/subcategory.dart';
import 'package:hawkers/Services/api.dart';

class ProductProvider with ChangeNotifier {
  RestApi restApi = RestApi();
  ProductProvider();
  List<Category> _categories = [];
  Category _selectedCategory;

  List<SubCategory> _subCategories = [];
  SubCategory _selectedSubCategory;

  List<Product> _products = [];

  List<Product> get products {
    return _products;
  }

  List<Category> get categories {
    return _categories;
  }

  Category get selectedCategory {
    return _selectedCategory;
  }

  List<SubCategory> get subCategories {
    return _subCategories;
  }

  SubCategory get selectedSubCategory {
    return _selectedSubCategory;
  }

  Future<List<Product>> getProduct(String access_token) async {
    final response = await restApi.getProduct(access_token);
    List<Product> products = productResponseFromJson(response.body).response;
    _products = products;
    return products;
  }

  Future<List<Category>> getCategory(String accessToken) async {
    final response = await restApi.getCategory(accessToken);
    print("Get Categories Response: ${response.body.toString()}");
    List<Category> categories =
        categoryResponseFromJson(response.body).response;
    _categories = categories;
    print(_categories);
    _selectedCategory = _categories.isEmpty ? null : _categories.first;
    getSubCategory(_selectedCategory?.id, accessToken);
    notifyListeners();

    return _categories;
  }

  Future<List<SubCategory>> getSubCategory(int id, String access_token) async {
    _subCategories = [];
    _selectedSubCategory = null;
    String body = jsonEncode({"category_id": id});
    final response = await restApi.getSubCategory(body, access_token);
    print("SubCategoriesResponse: ${response.body.toString()}");
    List<SubCategory> subCategories =
        subCategoryResponseFromJson(response.body).response;
    _subCategories = subCategories;
    _selectedSubCategory = subCategories[0];
    notifyListeners();
    return subCategories;
  }

  selectCategory(Category selectCategory, String accessToken) {
    if (selectCategory.id != _selectedCategory.id) {
      getSubCategory(selectCategory.id, accessToken);
    }
    _selectedCategory = selectCategory;
    notifyListeners();
  }

  selectSubCategory(SubCategory selectSubCategory) {
    _selectedSubCategory = selectSubCategory;
    notifyListeners();
  }
}
