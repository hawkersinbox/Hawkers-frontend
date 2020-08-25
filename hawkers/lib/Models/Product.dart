import 'dart:convert';

import 'package:flutter/material.dart';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));






class Products {
  Products({
    this.category,
    this.subcategory,
    this.productName,
    this.mfg,
    this.upperPrice,
    this.lowerPrice,
    this.comments,
    this.imageUrl,
  });
String category;
String subcategory;
String productName;
String mfg;
String upperPrice;
String lowerPrice;
String comments;
String imageUrl;
  factory Products.fromJson(Map<String, dynamic> json) => Products(

      category: json["category_id"],
      subcategory: json["sub_category_id"],
      productName: json["name"],
      mfg:json["description"],
      upperPrice: json["upper_price"],
      lowerPrice: json["lower_price"],
      imageUrl: json["image_url"]


  );
  Map<String, dynamic> toJson() => {
    category:"category",
    subcategory:"subcategory",
    productName:"productName",
    mfg:"description",
    upperPrice:"upperPrice",
    lowerPrice:"lowerPrice",
    imageUrl:"imageUrl",
  };
}



