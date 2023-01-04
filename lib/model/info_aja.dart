// To parse this JSON data, do
//
//     final infoaja = infoajaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Infoaja infoajaFromJson(String str) => Infoaja.fromJson(json.decode(str));

String infoajaToJson(Infoaja data) => json.encode(data.toJson());

class Infoaja {
  Infoaja({
    required this.status,
    required this.data,
  });

  Status status;
  InfoajaData data;

  factory Infoaja.fromJson(Map<String, dynamic> json) => Infoaja(
        status: Status.fromJson(json["status"]),
        data: InfoajaData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class InfoajaData {
  InfoajaData({
    required this.users,
  });

  List<User> users;

  factory InfoajaData.fromJson(Map<String, dynamic> json) => InfoajaData(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.emailAddress,
    required this.password,
    required this.designation,
    required this.willLogin,
    required this.role,
    required this.outletId,
    required this.companyId,
    required this.accountCreationDate,
    required this.language,
    required this.lastLogin,
    required this.activeStatus,
    required this.recoverToken,
    required this.recoverValid,
    required this.delStatus,
    required this.outletName,
  });

  String id;
  String fullName;
  String phone;
  String emailAddress;
  String password;
  String designation;
  String willLogin;
  String role;
  String outletId;
  String companyId;
  String accountCreationDate;
  String language;
  String lastLogin;
  String activeStatus;
  dynamic recoverToken;
  dynamic recoverValid;
  String delStatus;
  String outletName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        password: json["password"],
        designation: json["designation"],
        willLogin: json["will_login"],
        role: json["role"],
        outletId: json["outlet_id"],
        companyId: json["company_id"],
        accountCreationDate: json["account_creation_date"],
        language: json["language"],
        lastLogin: json["last_login"],
        activeStatus: json["active_status"],
        recoverToken: json["recover_token"],
        recoverValid: json["recover_valid"],
        delStatus: json["del_status"],
        outletName: json["outlet_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "email_address": emailAddress,
        "password": password,
        "designation": designation,
        "will_login": willLogin,
        "role": role,
        "outlet_id": outletId,
        "company_id": companyId,
        "account_creation_date": accountCreationDate,
        "language": language,
        "last_login": lastLogin,
        "active_status": activeStatus,
        "recover_token": recoverToken,
        "recover_valid": recoverValid,
        "del_status": delStatus,
        "outlet_name": outletName,
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
