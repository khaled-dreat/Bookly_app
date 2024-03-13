import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    log(name: "Url", endPoint);
    var response = await _dio.get('$baseUrl$endPoint');

    return response.data;
  }

  static void checkConnectitivy() async {
    await Connectivity().checkConnectivity();
  }
}
