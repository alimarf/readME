import 'package:dio/dio.dart';
import 'package:read_me/core/exceptions/cache_exception.dart';
import 'package:read_me/core/exceptions/server_exception.dart';

import 'exceptions.dart';

abstract class ExceptionHandler {
  static String getExceptionMessage(e) {
    if (e is DioError) {
      return ApiException.fromDioError(e).message;
    }

    if (e is ApiException) {
      return e.message;
    }

    if (e is AppException) {
      return e.message;
    }

    if (e is CacheException) {
      return e.message;
    }

    if (e is NetworkException) {
      return e.message;
    }

    if (e is String) {
      return e;
    }

    return e.toString();
  }
}
