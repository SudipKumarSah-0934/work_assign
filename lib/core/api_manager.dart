import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_assign/core/constants.dart';
import 'package:http/http.dart' as http;
import 'package:work_assign/core/networks/network_services.dart';
import '../task_1/data/url_create_model.dart';
import 'networks/base_client.dart';

class ApiManager {
  final http.Client client = http.Client();
  final String baseUrl = baseurl;
  BaseClient baseClient = BaseClient();
  static ApiManager? _instance;
  Dio dio = Dio();

  ApiManager._internal() {
    client;
    baseUrl;
  }

  Function(int send, int total)? sendProgressBar;

  ApiManager({this.sendProgressBar});

  static ApiManager get instance {
    _instance ??= ApiManager._internal();
    return _instance!;
  }
  Future<UrlCreateModel> getUrl(String urlText) async {
    try {
      final response = await client.post(
        Uri.parse('$baseurl' '$endpoint'),
        headers: getHeader(),
          body: {
      "url": urlText,
      "domain": domainName,
      "description": "string"
      },
      );
      debugPrint("debugging: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> value = json.decode(response.body);
        return UrlCreateModel.fromJson(value);
      } else {
        return UrlCreateModel.fromJson({"success": false});
      }
    } catch (e) {
      log('Login method: Failed to Share Data $e');
      return UrlCreateModel.fromJson({"success": false});
    }

  }
}