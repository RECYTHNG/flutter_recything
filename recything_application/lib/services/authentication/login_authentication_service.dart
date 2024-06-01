import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/models/authentication/login_authentication_model.dart';

class LoginAuthenticationService {
  final Dio dio = Dio();

  Future<LoginAuthenticationModel> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/login';
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response data: ${response.data}');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
          data: Data.fromJson(response.data['data']),
        );
      } else {
        return LoginAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return LoginAuthenticationModel(
          code: 400,
          message:
              "Key: 'Login.Password' Error:Field validation for 'Password' failed on the 'min' tag",
        );
      } else if (e.response?.statusCode == 401) {
        return LoginAuthenticationModel(
          code: 401,
          message: "email or password invalid!",
        );
      } else {
        return LoginAuthenticationModel(
          code: e.response?.statusCode ?? 500,
          message: 'Internal Server Error',
        );
      }
    }
  }
}
