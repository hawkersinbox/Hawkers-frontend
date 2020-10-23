// To parse this JSON data, do
//
//     final subCategoryResponse = subCategoryResponseFromJson(jsonString);

import 'dart:convert';

SubCategoryResponse subCategoryResponseFromJson(String str) =>
    SubCategoryResponse.fromJson(json.decode(str));

String subCategoryResponseToJson(SubCategoryResponse data) =>
    json.encode(data.toJson());

class SubCategoryResponse {
  SubCategoryResponse({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  List<SubCategory> response;

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      SubCategoryResponse(
        success: json["success"],
        message: json["message"],
        response: List<SubCategory>.from(
            json["response"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    this.id,
    this.categoryId,
    this.subCategory,
    this.createdAt,
    this.category,
  });

  int id;
  int categoryId;
  String subCategory;
  DateTime createdAt;
  String category;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        categoryId: json["category_id"],
        subCategory: json["sub_category"],
        createdAt: DateTime.parse(json["created_at"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "sub_category": subCategory,
        "created_at": createdAt.toIso8601String(),
        "category": category,
      };
}
