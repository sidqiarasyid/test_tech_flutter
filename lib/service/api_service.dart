import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_tech_flutter/model/background_hit.dart';
import 'package:test_tech_flutter/model/info_aja.dart';
import 'package:test_tech_flutter/model/init_data.dart';
import 'package:test_tech_flutter/model/login.dart';
import 'package:test_tech_flutter/model/Trx/trx-add_model.dart';
import 'package:test_tech_flutter/model/Trx/trx-del_model.dart';
import 'package:test_tech_flutter/model/Trx/trx-get_model.dart';
import 'package:test_tech_flutter/service/server_config.dart';

class APIService {
  Future<TrxGet> trxGet() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      "act": "trxGet",
      "outlet_id": 1,
      "user_id": 1,
      "data": {"trx_id": 0, "status": 1, "date_start": "", "date_end": ""}
    };
    print("RAW TRX-GET: " + body.toString());
    print("URL TRX-GET: " + ServerConfig.baseURL + ServerConfig.trxGet);
    Uri uri = Uri.parse(ServerConfig.baseURL + ServerConfig.trxGet);
    final newURI = uri.replace(queryParameters: body);
    final res = await http.get(newURI, headers: headers);
    print("STATUS CODE(TRX-GET): " + res.statusCode.toString());
    print("RES TRX-GET: " + res.body.toString());
    if (res.statusCode == 200) {
      return TrxGet.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<TrxAdd> trxAdd() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      "act": "trxAdd",
      "outlet_id": 1,
      "user_id": 1,
      "data": {
        "ptipe": 1,
        "curr_id": 1,
        "nominal": "123",
        "ket": "ini isi keterangan",
        "photo": "",
        "outlet_id1": 1,
        "outlet_id2": 0,
        "tgl": "2022-02-04"
      }
    };
    print("RAW TRX-ADD: " + body.toString());
    print("URL TRX-ADD: " + ServerConfig.baseURL + ServerConfig.trxAdd);
    final res = await http.post(
        Uri.parse(ServerConfig.baseURL + ServerConfig.trxAdd),
        headers: headers,
        body: jsonEncode(body));
    print("STATUS CODE(TRX-ADD): " + res.statusCode.toString());
    print("RES TRX-ADD: " + res.body.toString());
    if (res.statusCode == 200) {
      return TrxAdd.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<TrxDel> trxDel() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      "act": "trxDel",
      "outlet_id": 1,
      "user_id": 1,
      "data": {"trx_id": 1233424}
    };
    print("RAW TRX-DEL: " + body.toString());
    print("URL TRX-DEL: " + ServerConfig.baseURL + ServerConfig.trxDel);
    final res = await http.post(
        Uri.parse(ServerConfig.baseURL + ServerConfig.trxDel),
        headers: headers,
        body: jsonEncode(body));
    print("STATUS CODE(TRX-DEL): " + res.statusCode.toString());
    print("RES TRX-DEL: " + res.body.toString());
    if (res.statusCode == 200) {
      return TrxDel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<Login> login() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {"act": "LOGIN", "un": "admin@admin.com", "up": "admin"};
    print("RAW LOGIN: " + body.toString());
    print("URL LOGIN: " + ServerConfig.baseURL + ServerConfig.login);
    final res = await http.post(
        Uri.parse(ServerConfig.baseURL + ServerConfig.login),
        headers: headers,
        body: jsonEncode(body));
    print("STATUS CODE(LOGIN): " + res.statusCode.toString());
    print("RES LOGIN: " + res.body.toString());
    if (res.statusCode == 200) {
      return Login.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<Initdata> initData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {"act": "initData", "outlet_id": 1};
    print("RAW INITDATA: " + body.toString());
    print("URL INITDATA: " + ServerConfig.baseURL + ServerConfig.initData);
    Uri uri = Uri.parse(ServerConfig.baseURL + ServerConfig.initData);
    final newURI = uri.replace(
        queryParameters:
            body.map((key, value) => MapEntry(key, value.toString())));
    final res = await http.get(newURI, headers: headers);
    print("STATUS CODE(INITDATA): " + res.statusCode.toString());
    print("RES INITDATA: " + res.body.toString());
    if (res.statusCode == 200) {
      return Initdata.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<Infoaja> infoAja() async {
    print("URL INFOAJA: " + ServerConfig.baseURL + ServerConfig.infoAja);
    Uri uri = Uri.parse(ServerConfig.baseURL + ServerConfig.infoAja);
    final res = await http.get(uri);
    print("STATUS CODE(INFOAJA): " + res.statusCode.toString());
    print("RES INFOAJA: " + res.body.toString());
    if (res.statusCode == 200) {
      return Infoaja.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BackgroundHit> backgroundHit() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      "nama": "namanya",
      "email": "emailnya@mail.com",
      "nohp": "083333"
    };
    print("RAW BACKGROUNDHIT: " + body.toString());
    print("URL BACKGROUNDHIT: " +
        ServerConfig.baseURL +
        ServerConfig.backgroundHit);
    final res = await http.post(
        Uri.parse(ServerConfig.baseURL + ServerConfig.backgroundHit),
        headers: headers,
        body: jsonEncode(body));
    print("STATUS CODE(BACKGROUNDHIT): " + res.statusCode.toString());
    print("RES BACKGROUNDHIT: " + res.body.toString());
    if (res.statusCode == 200) {
      return BackgroundHit.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }
}
