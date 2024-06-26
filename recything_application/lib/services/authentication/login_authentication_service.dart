import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/authentication/login_authentication_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class LoginAuthenticationService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<LoginAuthenticationModel> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      var url = '$baseUrl/login';
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
        if (kDebugMode) {
          print(response.statusCode);
        }
        if (kDebugMode) {
          print(response.data['message']);
        }
        String token = response.data['data']['token'];
        SharedPref.saveToken(token: token);
        return LoginAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
          data: Data.fromJson(response.data['data']),
        );
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        if (kDebugMode) {
          print(response.data['message']);
        }
        return LoginAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        if (kDebugMode) {
          print(e.response?.statusCode);
        }
        if (kDebugMode) {
          print(e.response?.data['message']);
        }
        return LoginAuthenticationModel(
          code: 400,
          message:
              "Key: 'Login.Password' Error:Field validation for 'Password' failed on the 'min' tag",
        );
      } else if (e.response?.statusCode == 401) {
        if (kDebugMode) {
          print(e.response?.statusCode);
        }
        if (kDebugMode) {
          print(e.response?.data['message']);
        }
        return LoginAuthenticationModel(
          code: 401,
          message: "email or password invalid!",
        );
      } else {
        if (kDebugMode) {
          print(e.response?.statusCode);
        }
        if (kDebugMode) {
          print(e.response?.data['message']);
        }
        return LoginAuthenticationModel(
          code: e.response?.statusCode ?? 500,
          message: 'Internal Server Error',
        );
      }
    }
  }
}
