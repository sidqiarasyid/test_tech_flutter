// To parse this JSON data, do
//
//     final trxAdd = trxAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TrxAdd trxAddFromJson(String str) => TrxAdd.fromJson(json.decode(str));

String trxAddToJson(TrxAdd data) => json.encode(data.toJson());

class TrxAdd {
  TrxAdd({
    required this.status,
    required this.data,
  });

  Status status;
  TrxAddData data;

  factory TrxAdd.fromJson(Map<String, dynamic> json) => TrxAdd(
        status: Status.fromJson(json["status"]),
        data: TrxAddData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class TrxAddData {
  TrxAddData({
    required this.trxId,
    required this.trxDateCreated,
    required this.trxTgl,
    required this.trxPtipe,
    required this.trxNominal,
    required this.trxCurTipe,
    required this.trxKet,
    required this.trxPhoto,
    required this.trxAsalOutletId,
    required this.trxDarikeOutletId,
    required this.trxBayarVia,
    required this.trxUserId,
    required this.trxOutletId,
    required this.trxStatus,
    required this.trxIsStok,
    required this.trxDateModif,
    required this.trxDeleted,
    required this.trxDeletedBy,
    required this.trxDeletedKet,
  });

  String trxId;
  String trxDateCreated;
  String trxTgl;
  String trxPtipe;
  String trxNominal;
  String trxCurTipe;
  String trxKet;
  dynamic trxPhoto;
  String trxAsalOutletId;
  String trxDarikeOutletId;
  String trxBayarVia;
  String trxUserId;
  String trxOutletId;
  String trxStatus;
  String trxIsStok;
  String trxDateModif;
  String trxDeleted;
  String trxDeletedBy;
  dynamic trxDeletedKet;

  factory TrxAddData.fromJson(Map<String, dynamic> json) => TrxAddData(
        trxId: json["trx_id"],
        trxDateCreated: json["trx_date_created"],
        trxTgl: json["trx_tgl"],
        trxPtipe: json["trx_ptipe"],
        trxNominal: json["trx_nominal"],
        trxCurTipe: json["trx_cur_tipe"],
        trxKet: json["trx_ket"],
        trxPhoto: json["trx_photo"],
        trxAsalOutletId: json["trx_asal_outlet_id"],
        trxDarikeOutletId: json["trx_darike_outlet_id"],
        trxBayarVia: json["trx_bayar_via"],
        trxUserId: json["trx_user_id"],
        trxOutletId: json["trx_outlet_id"],
        trxStatus: json["trx_status"],
        trxIsStok: json["trx_is_stok"],
        trxDateModif: json["trx_date_modif"],
        trxDeleted: json["trx_deleted"],
        trxDeletedBy: json["trx_deleted_by"],
        trxDeletedKet: json["trx_deleted_ket"],
      );

  Map<String, dynamic> toJson() => {
        "trx_id": trxId,
        "trx_date_created": trxDateCreated,
        "trx_tgl": trxTgl,
        "trx_ptipe": trxPtipe,
        "trx_nominal": trxNominal,
        "trx_cur_tipe": trxCurTipe,
        "trx_ket": trxKet,
        "trx_photo": trxPhoto,
        "trx_asal_outlet_id": trxAsalOutletId,
        "trx_darike_outlet_id": trxDarikeOutletId,
        "trx_bayar_via": trxBayarVia,
        "trx_user_id": trxUserId,
        "trx_outlet_id": trxOutletId,
        "trx_status": trxStatus,
        "trx_is_stok": trxIsStok,
        "trx_date_modif": trxDateModif,
        "trx_deleted": trxDeleted,
        "trx_deleted_by": trxDeletedBy,
        "trx_deleted_ket": trxDeletedKet,
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
