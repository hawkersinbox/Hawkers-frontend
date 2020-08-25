import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool success;
  String message;
  Data response;

  User({
    this.success,
    this.message,
    this.response,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    success: json["success"],
    message: json["message"],
    response: Data.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "response": response.toJson(),
  };
}

class Data {
  String role;
  String email;
  String phone;
  String name;
  int id;
  int priority;
  String streetAddress;
  String city;
  String state;
  String pincode;
  String otp;

  Data({
    this.role,
    this.email,
    this.phone,
    this.name,
    this.id,
    this.priority,
    this.streetAddress,
    this.city,
    this.pincode,
    this.state,
    this.otp
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      role: json["role"],
      email: json["email"],
      phone: json["phone"],
      name: json["name"],
      id: json["id"],
      priority: json["priority"],
      streetAddress: json["streetAddress"],
      city:json["city"],
      pincode:json["pincode"],
      state:json["state"],
    otp:json['otp']

  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "email": email,
    "phone": phone,
    "name": name,
    "id": id,
    "priority": priority,
    "streetAddress":streetAddress,
    "state":state,
    "pincode":pincode,
    "city":city,
    'otp':otp,

  };
}