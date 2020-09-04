// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.success,
    this.message,
    this.response,
  });

  bool success;
  String message;
  Response response;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        message: json["message"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": response.toJson(),
      };
}

class Response {
  Response({
    this.id,
    this.firstName,
    this.lastName,
  });

  int id;
  String firstName;
  String lastName;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
      };
}
