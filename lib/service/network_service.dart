import 'dart:convert';

import 'package:http/http.dart';


import '../model/emplist_model.dart';
import '../model/empone_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  static String API_LIST = "/api/v1/employees";
  static String API_employee = "/api/v1/employee/1";

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static EmpList parseEmpList(String body){
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }
}