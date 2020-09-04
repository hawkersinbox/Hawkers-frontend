// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  List<Category> response;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        success: json["success"],
        message: json["message"],
        response: List<Category>.from(
            json["response"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        category: json["category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
