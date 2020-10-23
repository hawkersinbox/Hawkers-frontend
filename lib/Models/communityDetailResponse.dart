// To parse this JSON data, do
//
//     final communityDetailResponse = communityDetailResponseFromJson(jsonString);

import 'dart:convert';

CommunityDetailResponse communityDetailResponseFromJson(String str) =>
    CommunityDetailResponse.fromJson(json.decode(str));

String communityDetailResponseToJson(CommunityDetailResponse data) =>
    json.encode(data.toJson());

class CommunityDetailResponse {
  CommunityDetailResponse({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  CommunityDetail response;

  factory CommunityDetailResponse.fromJson(Map<String, dynamic> json) =>
      CommunityDetailResponse(
        success: json["success"],
        message: json["message"],
        response: CommunityDetail.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": response.toJson(),
      };
}

class CommunityDetail {
  CommunityDetail({
    this.id,
    this.type,
    this.contactPerson,
    this.contactNumber,
    this.alternateContactNumber,
    this.email,
    this.imageUrl,
    this.availableDays,
    this.maxShopCount,
    this.stage,
    this.createdAt,
    this.streetAddress1,
    this.city,
    this.state,
    this.pincode,
  });

  int id;
  String type;
  dynamic contactPerson;
  String contactNumber;
  String alternateContactNumber;
  String email;
  dynamic imageUrl;
  int availableDays;
  int maxShopCount;
  String stage;
  DateTime createdAt;
  String streetAddress1;
  String city;
  String state;
  String pincode;

  factory CommunityDetail.fromJson(Map<String, dynamic> json) =>
      CommunityDetail(
        id: json["id"],
        type: json["type"],
        contactPerson: json["contact_person"],
        contactNumber: json["contact_number"],
        alternateContactNumber: json["alternate_contact_number"],
        email: json["email"],
        imageUrl: json["image_url"],
        availableDays: json["available_days"],
        maxShopCount: json["max_shop_count"],
        stage: json["stage"],
        createdAt: DateTime.parse(json["created_at"]),
        streetAddress1: json["street_address1"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "contact_person": contactPerson,
        "contact_number": contactNumber,
        "alternate_contact_number": alternateContactNumber,
        "email": email,
        "image_url": imageUrl,
        "available_days": availableDays,
        "max_shop_count": maxShopCount,
        "stage": stage,
        "created_at": createdAt.toIso8601String(),
        "street_address1": streetAddress1,
        "city": city,
        "state": state,
        "pincode": pincode,
      };
}
