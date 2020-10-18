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

  Future<List<Product>> getProduct() async {
    final response = await restApi.getProduct();
    List<Product> products = productResponseFromJson(response.body).response;
    _products = products;
    return products;
  }

  Future<List<Category>> getCategory() async {
    final response = await restApi.getCategory();
    List<Category> categories =
        categoryResponseFromJson(response.body).response;
    _categories = categories;
    _selectedCategory = _categories[0];
    getSubCategory(_selectedCategory.id);
    notifyListeners();
    return _categories;
  }

  Future<List<SubCategory>> getSubCategory(int id) async {
    _subCategories = [];
    _selectedSubCategory = null;
    String body = jsonEncode({"category_id": id});
    final response = await restApi.getSubCategory(body);
    List<SubCategory> subCategories =
        subCategoryResponseFromJson(response.body).response;
    _subCategories = subCategories;
    _selectedSubCategory = subCategories[0];
    notifyListeners();
    return subCategories;
  }

  selectCategory(Category selectCategory) {
    if (selectCategory.id != _selectedCategory.id) {
      getSubCategory(selectCategory.id);
    }
    _selectedCategory = selectCategory;
    notifyListeners();
  }

  selectSubCategory(SubCategory selectSubCategory) {
    _selectedSubCategory = selectSubCategory;
    notifyListeners();
  }
}
