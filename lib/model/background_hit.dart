// To parse this JSON data, do
//
//     final backgroundHit = backgroundHitFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BackgroundHit backgroundHitFromJson(String str) =>
    BackgroundHit.fromJson(json.decode(str));

String backgroundHitToJson(BackgroundHit data) => json.encode(data.toJson());

class BackgroundHit {
  BackgroundHit({
    required this.status,
    required this.data,
  });

  Status status;
  BackgroundHitData data;

  factory BackgroundHit.fromJson(Map<String, dynamic> json) => BackgroundHit(
        status: Status.fromJson(json["status"]),
        data: BackgroundHitData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class BackgroundHitData {
  BackgroundHitData({
    required this.serverTime,
    required this.sender,
  });

  String serverTime;
  Sender sender;

  factory BackgroundHitData.fromJson(Map<String, dynamic> json) =>
      BackgroundHitData(
        serverTime: json["Server-Time"],
        sender: Sender.fromJson(json["Sender"]),
      );

  Map<String, dynamic> toJson() => {
        "Server-Time": serverTime,
        "Sender": sender.toJson(),
      };
}

class Sender {
  Sender({
    required this.nama,
    required this.email,
    required this.nohp,
  });

  String nama;
  String email;
  String nohp;

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        nama: json["nama"],
        email: json["email"],
        nohp: json["nohp"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "nohp": nohp,
      };
}

class Status {
  Status({
    required this.error,
    required this.login,
    required this.apiVer,
    required this.devDebugParam,
  });

  int error;
  bool login;
  String apiVer;
  String devDebugParam;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        login: json["login"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "login": login,
        "api-ver": apiVer,
        "dev-debug-param": devDebugParam,
      };
}
