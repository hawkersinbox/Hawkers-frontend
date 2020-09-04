// To parse this JSON data, do
//
//     final communityResponse = communityResponseFromJson(jsonString);

import 'dart:convert';

CommunityResponse communityResponseFromJson(String str) =>
    CommunityResponse.fromJson(json.decode(str));

String communityResponseToJson(CommunityResponse data) =>
    json.encode(data.toJson());

class CommunityResponse {
  CommunityResponse({
    this.success,
    this.message,
    this.response,
  });
  bool success;
  String message;
  List<Community> response;

  factory CommunityResponse.fromJson(Map<String, dynamic> json) =>
      CommunityResponse(
        success: json["success"],
        message: json["message"],
        response: List<Community>.from(
            json["response"].map((x) => Community.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Community {
  Community({
    this.id,
    this.type,
    this.contactPerson,
    this.contactNumber,
    this.alternateContactNumbr,
    this.email,
    this.imageUrl,
    this.addressId,
    this.availableDays,
    this.maxShopCount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  int id;
  String type;
  String contactPerson;
  String contactNumber;
  dynamic alternateContactNumbr;
  dynamic email;
  dynamic imageUrl;
  int addressId;
  int availableDays;
  int maxShopCount;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic createdBy;
  dynamic updatedBy;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        type: json["type"],
        contactPerson: json["contact_person"],
        contactNumber: json["contact_number"],
        alternateContactNumbr: json["alternate_contact_numbr"],
        email: json["email"],
        imageUrl: json["image_url"],
        addressId: json["address_id"],
        availableDays: json["available_days"],
        maxShopCount: json["max_shop_count"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "contact_person": contactPerson,
        "contact_number": contactNumber,
        "alternate_contact_numbr": alternateContactNumbr,
        "email": email,
        "image_url": imageUrl,
        "address_id": addressId,
        "available_days": availableDays,
        "max_shop_count": maxShopCount,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
      };
}
