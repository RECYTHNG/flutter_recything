import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/models/authentication/one_time_password_authentication_model.dart';
import 'package:recything_application/models/authentication/register_authentication_model.dart';

class AuthenticationService {
  final Dio dio = Dio();

  Future<RegisterAuthenticationModel> postRegister({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/register';
      final response = await dio.post(
        url,
        data: {
          'name': name,
          'email': email,
          'phone_number': phoneNumber,
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
        return RegisterAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
          data: Data.fromJson(response.data['data']),
        );
      } else {
        return RegisterAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return RegisterAuthenticationModel(
          code: 409,
          message: "Email already exists",
        );
      } else {
        return RegisterAuthenticationModel(
          code: e.response?.statusCode ?? 500,
          message: 'Internal Server Error',
        );
      }
    }
  }

  Future<OneTimePasswordAuthenticationModel> postOneTimePassword({
    required String email,
    required int otp,
  }) async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/verify-otp';
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'otp': otp,
        },
      );

      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response data: ${response.data}');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return OneTimePasswordAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
        );
      } else {
        return OneTimePasswordAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return OneTimePasswordAuthenticationModel(
          code: 404,
          message: "Email not found",
        );
      } else {
        return OneTimePasswordAuthenticationModel(
          code: e.response?.statusCode ?? 500,
          message: 'Internal Server Error',
        );
      }
    }
  }
}
