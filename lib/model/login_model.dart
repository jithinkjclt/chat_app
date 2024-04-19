// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? userId;
  String? email;
  String? username;

  LoginModel({
    this.userId,
    this.email,
    this.username,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    userId: json["user_id"],
    email: json["email"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "email": email,
    "username": username,
  };
}
