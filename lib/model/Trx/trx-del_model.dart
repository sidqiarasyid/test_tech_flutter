// To parse this JSON data, do
//
//     final trxDel = trxDelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TrxDel trxDelFromJson(String str) => TrxDel.fromJson(json.decode(str));

String trxDelToJson(TrxDel data) => json.encode(data.toJson());

class TrxDel {
  TrxDel({
    required this.status,
    required this.data,
  });

  Status status;
  bool data;

  factory TrxDel.fromJson(Map<String, dynamic> json) => TrxDel(
        status: Status.fromJson(json["status"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data,
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
