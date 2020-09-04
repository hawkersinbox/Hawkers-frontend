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
    this.subCategory,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String subCategory;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        subCategory: json["sub_category"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_category": subCategory,
        "category_id": categoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
