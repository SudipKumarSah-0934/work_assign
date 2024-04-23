import 'package:dio/dio.dart';
import 'package:work_assign/core/constants.dart';


Map<String, String> getHeader({
  bool addToken = true,
}) {
  return {
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
