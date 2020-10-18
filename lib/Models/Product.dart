// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  List<Product> response;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        success: json["success"],
        message: json["message"],
        response: List<Product>.from(
            json["response"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.upperPrice,
    this.lowerPrice,
    this.rating,
    this.description,
    this.imageUrl,
    this.lastUsedAt,
    this.category,
    this.subCategory,
  });

  int id;
  String name;
  int upperPrice;
  int lowerPrice;
  int rating;
  String description;
  String imageUrl;
  dynamic lastUsedAt;
  String category;
  String subCategory;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        upperPrice: json["upper_price"],
        lowerPrice: json["lower_price"],
        rating: json["rating"],
        description: json["description"],
        imageUrl: json["image_url"],
        lastUsedAt: json["last_used_at"],
        category: json["category"],
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "upper_price": upperPrice,
        "lower_price": lowerPrice,
        "rating": rating,
        "description": description,
        "image_url": imageUrl,
        "last_used_at": lastUsedAt,
        "category": category,
        "sub_category": subCategory,
      };
}
