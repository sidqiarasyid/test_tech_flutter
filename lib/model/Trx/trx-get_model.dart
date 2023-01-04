// To parse this JSON data, do
//
//     final trxGet = trxGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TrxGet trxGetFromJson(String str) => TrxGet.fromJson(json.decode(str));

String trxGetToJson(TrxGet data) => json.encode(data.toJson());

class TrxGet {
  TrxGet({
    required this.status,
    required this.data,
  });

  Status status;
  List<TrxGetData> data;

  factory TrxGet.fromJson(Map<String, dynamic> json) => TrxGet(
        status: Status.fromJson(json["status"]),
        data: List<TrxGetData>.from(
            json["data"].map((x) => TrxGetData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TrxGetData {
  TrxGetData({
    required this.trxPtipeNama,
    required this.trxCurtipeVar,
    required this.trxAsalOutletNama,
    required this.trxDarikeOutletId,
    required this.trxDarikeOutletNama,
    required this.trxId,
    required this.trxTgl,
    required this.trxPtipe,
    required this.trxDateCreated,
    required this.trxNominal,
    required this.trxKet,
    required this.trxStatus,
    required this.trxIsStok,
    required this.trxAsalOutletId,
    required this.trxOutletId,
  });

  String trxPtipeNama;
  String trxCurtipeVar;
  String trxAsalOutletNama;
  String trxDarikeOutletId;
  String trxDarikeOutletNama;
  String trxId;
  String trxTgl;
  String trxPtipe;
  String trxDateCreated;
  String trxNominal;
  String trxKet;
  String trxStatus;
  String trxIsStok;
  String trxAsalOutletId;
  String trxOutletId;

  factory TrxGetData.fromJson(Map<String, dynamic> json) => TrxGetData(
        trxPtipeNama: json["trx_ptipe_nama"],
        trxCurtipeVar: json["trx_curtipe_var"],
        trxAsalOutletNama: json["trx_asal_outlet_nama"],
        trxDarikeOutletId: json["trx_darike_outlet_id"],
        trxDarikeOutletNama: json["trx_darike_outlet_nama"],
        trxId: json["trx_id"],
        trxTgl: json["trx_tgl"],
        trxPtipe: json["trx_ptipe"],
        trxDateCreated: json["trx_date_created"],
        trxNominal: json["trx_nominal"],
        trxKet: json["trx_ket"],
        trxStatus: json["trx_status"],
        trxIsStok: json["trx_is_stok"],
        trxAsalOutletId: json["trx_asal_outlet_id"],
        trxOutletId: json["trx_outlet_id"],
      );

  Map<String, dynamic> toJson() => {
        "trx_ptipe_nama": trxPtipeNama,
        "trx_curtipe_var": trxCurtipeVar,
        "trx_asal_outlet_nama": trxAsalOutletNama,
        "trx_darike_outlet_id": trxDarikeOutletId,
        "trx_darike_outlet_nama": trxDarikeOutletNama,
        "trx_id": trxId,
        "trx_tgl": trxTgl,
        "trx_ptipe": trxPtipe,
        "trx_date_created": trxDateCreated,
        "trx_nominal": trxNominal,
        "trx_ket": trxKet,
        "trx_status": trxStatus,
        "trx_is_stok": trxIsStok,
        "trx_asal_outlet_id": trxAsalOutletId,
        "trx_outlet_id": trxOutletId,
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
