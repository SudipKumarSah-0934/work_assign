import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import 'network_services.dart';

class BaseClient {
  Future<Response?> postRequest({
    String baseUrl = endpoint,
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    required String path,
  }) async {
    Response? response;
    Dio dio = Dio();
    try {
      Map<String, String> header = getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      response = await dio.post(
        baseUrl + path,
        options: Options(
          headers: header,
          sendTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
        ),
        data: data,
      );
      if (kDebugMode) {
        log("POST Status code ${response.statusCode} for $path");
      }
    } catch (e) {
      if (e is DioError) {
        return e.response;
      }
      response = null;
    }
    return response;
  }
}
