// To parse this JSON data, do
//
//     final requestResponse = requestResponseFromJson(jsonString);

import 'dart:convert';

RequestDetailResponse requestDetailResponseFromJson(String str) =>
    RequestDetailResponse.fromJson(json.decode(str));

String requestDetailResponseToJson(RequestDetailResponse data) =>
    json.encode(data.toJson());

class RequestDetailResponse {
  RequestDetailResponse({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  RequestDetail response;

  factory RequestDetailResponse.fromJson(Map<String, dynamic> json) =>
      RequestDetailResponse(
        success: json["success"],
        message: json["message"],
        response: RequestDetail.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": response.toJson(),
      };
}

class RequestDetail {
  RequestDetail({
    this.id,
    this.imageUrl,
    this.sellerComment,
    this.adminComment,
    this.bookingDate,
    this.stage,
    this.createdAt,
    this.product,
    this.paymentId,
    this.communityId,
    this.type,
    this.contactPerson,
    this.contactNumber,
    this.alternateContactNumber,
    this.email,
    this.availableDays,
    this.maxShopCount,
    this.streetAddress1,
    this.city,
    this.state,
    this.pincode,
  });

  int id;
  dynamic imageUrl;
  String sellerComment;
  dynamic adminComment;
  DateTime bookingDate;
  String stage;
  DateTime createdAt;
  String product;
  dynamic paymentId;
  int communityId;
  String type;
  dynamic contactPerson;
  String contactNumber;
  String alternateContactNumber;
  String email;
  int availableDays;
  int maxShopCount;
  String streetAddress1;
  String city;
  String state;
  String pincode;

  factory RequestDetail.fromJson(Map<String, dynamic> json) => RequestDetail(
        id: json["id"],
        imageUrl: json["image_url"],
        sellerComment: json["seller_comment"],
        adminComment: json["admin_comment"],
        bookingDate: DateTime.parse(json["booking_date"]),
        stage: json["stage"],
        createdAt: DateTime.parse(json["created_at"]),
        product: json["product"],
        paymentId: json["payment_id"],
        communityId: json["community_id"],
        type: json["type"],
        contactPerson: json["contact_person"],
        contactNumber: json["contact_number"],
        alternateContactNumber: json["alternate_contact_number"],
        email: json["email"],
        availableDays: json["available_days"],
        maxShopCount: json["max_shop_count"],
        streetAddress1: json["street_address1"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "seller_comment": sellerComment,
        "admin_comment": adminComment,
        "booking_date": bookingDate.toIso8601String(),
        "stage": stage,
        "created_at": createdAt.toIso8601String(),
        "product": product,
        "payment_id": paymentId,
        "community_id": communityId,
        "type": type,
        "contact_person": contactPerson,
        "contact_number": contactNumber,
        "alternate_contact_number": alternateContactNumber,
        "email": email,
        "available_days": availableDays,
        "max_shop_count": maxShopCount,
        "street_address1": streetAddress1,
        "city": city,
        "state": state,
        "pincode": pincode,
      };
}
