// To parse this JSON data, do
//
//     final salesRequestResponse = salesRequestResponseFromJson(jsonString);

import 'dart:convert';

SalesRequestResponse salesRequestResponseFromJson(String str) =>
    SalesRequestResponse.fromJson(json.decode(str));

String salesRequestResponseToJson(SalesRequestResponse data) =>
    json.encode(data.toJson());

class SalesRequestResponse {
  SalesRequestResponse({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  List<SalesRequest> response;

  factory SalesRequestResponse.fromJson(Map<String, dynamic> json) =>
      SalesRequestResponse(
        success: json["success"],
        message: json["message"],
        response: List<SalesRequest>.from(
            json["response"].map((x) => SalesRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class SalesRequest {
  SalesRequest({
    this.id,
    this.imageUrl,
    this.sellerComment,
    this.adminComment,
    this.status,
    this.createdAt,
    this.product,
  });

  int id;
  String imageUrl;
  String sellerComment;
  dynamic adminComment;
  String status;
  DateTime createdAt;
  String product;

  factory SalesRequest.fromJson(Map<String, dynamic> json) => SalesRequest(
        id: json["id"],
        imageUrl: json["image_url"],
        sellerComment: json["seller_comment"],
        adminComment: json["admin_comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "seller_comment": sellerComment,
        "admin_comment": adminComment,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "product": product,
      };
}
