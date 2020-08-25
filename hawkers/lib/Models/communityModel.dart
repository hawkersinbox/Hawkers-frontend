import 'package:flutter/material.dart';
import 'dart:convert';


List<CommunityResponse> communityResponseFromJson(String str) => List<CommunityResponse>.from(json.decode(str).map((x) => CommunityResponse.fromJson(x)));

String communityResponseToJson(List<CommunityResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommunityResponse {
  CommunityResponse({

    this.communityname,
    this.mobile,
    this.alternateMobile,
    this.email,
    this.streetAddress,
    this.city,
    this.state,
    this.pincode,
    this.otp,
    this.availableDays,
    this.maxShopCount,
    this.success,



  });
  String communityname;
  String mobile;
  String alternateMobile;
  String email;
  String streetAddress;
  String city;
  String state;
  String pincode;
  String otp;
  String availableDays;
  String maxShopCount;
  bool success;

  factory CommunityResponse.fromJson(Map<String, dynamic> json) =>
  CommunityResponse(
        communityname: json["type"],
        mobile: json["contact_number"],
        alternateMobile: json["contact_person"],
        email: json[""],
        streetAddress: json["street_address"],
        city:json["city"],
        state: json["state"],
        pincode: json["pincode"],
        maxShopCount: json["max_shop_count"],
        availableDays: json["available_days"],
        success: json["success"]





      );

  Map<String, dynamic> toJson() =>
      {
        "type":communityname,
        "contact_person":alternateMobile,
        "contact_number":mobile,
        "street_address":streetAddress,
        "city":city,
        "state":state,
        "pincode":pincode,
        "max_shop_count":maxShopCount,
        "available_days":availableDays,
        "city": city,
        "success": success,

      };
}