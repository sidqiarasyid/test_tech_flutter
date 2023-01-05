// To parse this JSON data, do
//
//     final initdata = initdataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Initdata initdataFromJson(String str) => Initdata.fromJson(json.decode(str));

String initdataToJson(Initdata data) => json.encode(data.toJson());

class Initdata {
  Initdata({
    required this.status,
    required this.data,
  });

  Status status;
  InitdataData data;

  factory Initdata.fromJson(Map<String, dynamic> json) => Initdata(
        status: Status.fromJson(json["status"]),
        data: InitdataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class InitdataData {
  InitdataData({
    required this.outlet,
    required this.outletSubs,
    required this.trxTipe,
    required this.payTipe,
    required this.curTipe,
  });

  Outlet outlet;
  List<OutletSub> outletSubs;
  List<TrxTipe> trxTipe;
  List<PayTipe> payTipe;
  List<CurTipe> curTipe;

  factory InitdataData.fromJson(Map<String, dynamic> json) => InitdataData(
        outlet: Outlet.fromJson(json["outlet"]),
        outletSubs: List<OutletSub>.from(
            json["outlet_subs"].map((x) => OutletSub.fromJson(x))),
        trxTipe: List<TrxTipe>.from(
            json["trx_tipe"].map((x) => TrxTipe.fromJson(x))),
        payTipe: List<PayTipe>.from(
            json["pay_tipe"].map((x) => PayTipe.fromJson(x))),
        curTipe: List<CurTipe>.from(
            json["cur_tipe"].map((x) => CurTipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "outlet": outlet.toJson(),
        "outlet_subs": List<dynamic>.from(outletSubs.map((x) => x.toJson())),
        "trx_tipe": List<dynamic>.from(trxTipe.map((x) => x.toJson())),
        "pay_tipe": List<dynamic>.from(payTipe.map((x) => x.toJson())),
        "cur_tipe": List<dynamic>.from(curTipe.map((x) => x.toJson())),
      };
}

class CurTipe {
  CurTipe({
    required this.ctId,
    required this.ctNama,
    required this.ctLogo,
    required this.ctKet,
  });

  String ctId;
  String ctNama;
  String ctLogo;
  String ctKet;

  factory CurTipe.fromJson(Map<String, dynamic> json) => CurTipe(
        ctId: json["ct_id"],
        ctNama: json["ct_nama"],
        ctLogo: json["ct_logo"],
        ctKet: json["ct_ket"],
      );

  Map<String, dynamic> toJson() => {
        "ct_id": ctId,
        "ct_nama": ctNama,
        "ct_logo": ctLogo,
        "ct_ket": ctKet,
      };
}

class Outlet {
  Outlet({
    required this.id,
    required this.outletName,
    required this.outletCode,
    required this.outletAddress,
    required this.outletPhone,
    required this.invoicePrint,
    required this.startingDate,
    required this.invoiceFooter,
    required this.dateFormat,
    required this.timeZone,
    required this.currency,
    required this.currencyShow,
    required this.decimalShow,
    required this.decimalDigit,
    required this.decimalZeroHide,
    required this.outletMode,
    required this.showIngCode,
    required this.hppMode,
    required this.cekAksesBydb,
    required this.collectTax,
    required this.taxRegistrationTitle,
    required this.taxRegistrationNo,
    required this.taxTitle,
    required this.taxUseGlobal,
    required this.taxIsGst,
    required this.stateCode,
    required this.preOrPostPayment,
    required this.userId,
    required this.parentId,
    required this.orderId,
    required this.maxSub,
    required this.delStatus,
  });

  String id;
  String outletName;
  String outletCode;
  String outletAddress;
  String outletPhone;
  String invoicePrint;
  String startingDate;
  String invoiceFooter;
  String dateFormat;
  String timeZone;
  String currency;
  String currencyShow;
  String decimalShow;
  String decimalDigit;
  String decimalZeroHide;
  String outletMode;
  String showIngCode;
  String hppMode;
  String cekAksesBydb;
  String collectTax;
  String taxRegistrationTitle;
  String taxRegistrationNo;
  String taxTitle;
  String taxUseGlobal;
  String taxIsGst;
  String stateCode;
  String preOrPostPayment;
  String userId;
  String parentId;
  String orderId;
  String maxSub;
  String delStatus;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        id: json["id"],
        outletName: json["outlet_name"],
        outletCode: json["outlet_code"],
        outletAddress: json["outlet_address"],
        outletPhone: json["outlet_phone"],
        invoicePrint: json["invoice_print"],
        startingDate: json["starting_date"],
        invoiceFooter: json["invoice_footer"],
        dateFormat: json["date_format"],
        timeZone: json["time_zone"],
        currency: json["currency"],
        currencyShow: json["currency_show"],
        decimalShow: json["decimal_show"],
        decimalDigit: json["decimal_digit"],
        decimalZeroHide: json["decimal_zero_hide"],
        outletMode: json["outlet_mode"],
        showIngCode: json["show_ing_code"],
        hppMode: json["hpp_mode"],
        cekAksesBydb: json["cek_akses_bydb"],
        collectTax: json["collect_tax"],
        taxRegistrationTitle: json["tax_registration_title"],
        taxRegistrationNo: json["tax_registration_no"],
        taxTitle: json["tax_title"],
        taxUseGlobal: json["tax_use_global"],
        taxIsGst: json["tax_is_gst"],
        stateCode: json["state_code"],
        preOrPostPayment: json["pre_or_post_payment"],
        userId: json["user_id"],
        parentId: json["parent_id"],
        orderId: json["order_id"],
        maxSub: json["max_sub"],
        delStatus: json["del_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "outlet_name": outletName,
        "outlet_code": outletCode,
        "outlet_address": outletAddress,
        "outlet_phone": outletPhone,
        "invoice_print": invoicePrint,
        "starting_date": startingDate,
        "invoice_footer": invoiceFooter,
        "date_format": dateFormat,
        "time_zone": timeZone,
        "currency": currency,
        "currency_show": currencyShow,
        "decimal_show": decimalShow,
        "decimal_digit": decimalDigit,
        "decimal_zero_hide": decimalZeroHide,
        "outlet_mode": outletMode,
        "show_ing_code": showIngCode,
        "hpp_mode": hppMode,
        "cek_akses_bydb": cekAksesBydb,
        "collect_tax": collectTax,
        "tax_registration_title": taxRegistrationTitle,
        "tax_registration_no": taxRegistrationNo,
        "tax_title": taxTitle,
        "tax_use_global": taxUseGlobal,
        "tax_is_gst": taxIsGst,
        "state_code": stateCode,
        "pre_or_post_payment": preOrPostPayment,
        "user_id": userId,
        "parent_id": parentId,
        "order_id": orderId,
        "max_sub": maxSub,
        "del_status": delStatus,
      };
}

class OutletSub {
  OutletSub({
    required this.id,
    required this.outletName,
    required this.parentId,
    required this.orderId,
  });

  String id;
  String outletName;
  String parentId;
  String orderId;

  factory OutletSub.fromJson(Map<String, dynamic> json) => OutletSub(
        id: json["id"],
        outletName: json["outlet_name"],
        parentId: json["parent_id"],
        orderId: json["order_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "outlet_name": outletName,
        "parent_id": parentId,
        "order_id": orderId,
      };
}

class PayTipe {
  PayTipe({
    required this.byrId,
    required this.byrNama,
    required this.byrDesc,
    required this.byrQrisData,
    required this.byrQrisImage,
    required this.byrHttp,
    required this.outletId,
    required this.delStatus,
  });

  String byrId;
  String byrNama;
  String byrDesc;
  String byrQrisData;
  String byrQrisImage;
  String byrHttp;
  String outletId;
  String delStatus;

  factory PayTipe.fromJson(Map<String, dynamic> json) => PayTipe(
        byrId: json["byr_id"],
        byrNama: json["byr_nama"],
        byrDesc: json["byr_desc"],
        byrQrisData: json["byr_qris_data"],
        byrQrisImage: json["byr_qris_image"],
        byrHttp: json["byr_http"],
        outletId: json["outlet_id"],
        delStatus: json["del_status"],
      );

  Map<String, dynamic> toJson() => {
        "byr_id": byrId,
        "byr_nama": byrNama,
        "byr_desc": byrDesc,
        "byr_qris_data": byrQrisData,
        "byr_qris_image": byrQrisImage,
        "byr_http": byrHttp,
        "outlet_id": outletId,
        "del_status": delStatus,
      };
}

class TrxTipe {
  TrxTipe({
    required this.id,
    required this.nama,
    required this.trx,
    required this.outletId,
    required this.delStatus,
  });

  String id;
  String nama;
  String trx;
  String outletId;
  String delStatus;

  factory TrxTipe.fromJson(Map<String, dynamic> json) => TrxTipe(
        id: json["id"],
        nama: json["nama"],
        trx: json["trx"],
        outletId: json["outlet_id"],
        delStatus: json["del_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "trx": trx,
        "outlet_id": outletId,
        "del_status": delStatus,
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
