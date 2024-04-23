import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'failure.dart';

Either<Map<String, dynamic>, Failure> getDecodedResponse(Response? response) {
  List<int> successStatusCodes = [
    200,
    201,
    202,
  ];

  if (response == null) {
    return Right(Failure.fromJson({}));
  } else if (successStatusCodes.contains(response.statusCode)) {
    Map<String, dynamic> jsonResponse = response.data;
    return Left(jsonResponse);
  } else {
    return Right(Failure.fromJson(response.data));
  }
}
