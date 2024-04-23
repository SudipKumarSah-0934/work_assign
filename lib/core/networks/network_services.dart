import 'package:dio/dio.dart';
import 'package:work_assign/core/constants.dart';

const int _connectionTimeOut = 10 * 100000;
const int _receiveTimeOut = 10 * 100000;

Map<String, String> getHeader({
  bool addToken = true,
}) {
  return {
    'Content-Type': 'application/json',
    'authorization': 'Bearer $apiToken',
  };
}

BaseOptions getDioOptions() {
  return BaseOptions(
    baseUrl: baseurl,
    connectTimeout: Duration(seconds: 50),
    receiveTimeout: Duration(seconds: 50),
    headers: getHeader(),
  );
}
