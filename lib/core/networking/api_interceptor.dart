import 'package:dio/dio.dart' as Dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import '../../app/modules/shared/routes/pages.dart';
import '../config/app_config.dart';
import '../services/auth_token_manager.dart';

class ApiInterceptor extends Dio.Interceptor {
  final AppConfig appConfig;
  final AuthTokenManager tokenManager;

  ApiInterceptor({required this.appConfig, required this.tokenManager});

  Future<void> signOut() async {
    Get.find<AuthTokenManager>().clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.currentRoute == SharedRoutes.INFORMATION) {
        return;
      }

      //TODO: Kick user
      // Get.offAllNamed(SharedRoutes.INFORMATION, parameters: {
      //   'title': 'Token tidak valid',
      //   'description': 'Akun yang sama telah login di device yang lain',
      //   'navigation_label': 'Login',
      //   'destination': AuthRoutes.LOGIN
      // });
    });
  }

  @override
  Future<void> onRequest(
      Dio.RequestOptions options, Dio.RequestInterceptorHandler handler) async {
    final token = tokenManager.getAccessToken();

    if (token != null && !options.uri.toString().contains('login')) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Dio.Response response, Dio.ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      signOut();
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(Dio.DioException error, Dio.ErrorInterceptorHandler handler) {
    if (error.response?.statusCode == 401 &&
        error.response?.realUri.toString().contains('/login') == false) {
      signOut();
    }
    return super.onError(error, handler);
  }
}
