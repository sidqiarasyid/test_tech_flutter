// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.status,
    required this.data,
  });

  Status status;
  LoginData data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: Status.fromJson(json["status"]),
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class LoginData {
  LoginData({
    required this.user,
  });

  User user;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.userId,
    required this.language,
    required this.fullName,
    required this.phone,
    required this.emailAddress,
    required this.role,
    required this.designation,
    required this.outletId,
  });

  String userId;
  String language;
  String fullName;
  String phone;
  String emailAddress;
  String role;
  String designation;
  String outletId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        language: json["language"],
        fullName: json["full_name"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        role: json["role"],
        designation: json["designation"],
        outletId: json["outlet_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "language": language,
        "full_name": fullName,
        "phone": phone,
        "email_address": emailAddress,
        "role": role,
        "designation": designation,
        "outlet_id": outletId,
      };
}

class Status {
  Status({
    required this.error,
    required this.login,
    required this.userId,
    required this.role,
    required this.apiVer,
    required this.devDebugParam,
  });

  int error;
  bool login;
  String userId;
  String role;
  String apiVer;
  String devDebugParam;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        login: json["login"],
        userId: json["user_id"],
        role: json["role"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "login": login,
        "user_id": userId,
        "role": role,
        "api-ver": apiVer,
        "dev-debug-param": devDebugParam,
      };
}
