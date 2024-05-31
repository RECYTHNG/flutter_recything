import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/models/authentication/one_time_password_authentication_model.dart';

class OneTimePasswordAuthenticationService {
  final Dio dio = Dio();

  //Post OTP
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
      if (e.response?.statusCode == 409) {
        return OneTimePasswordAuthenticationModel(
          code: 409,
          message: "Otp is invalid",
        );
      } else {
        return OneTimePasswordAuthenticationModel(
          code: e.response?.statusCode ?? 500,
          message: 'Internal Server Error',
        );
      }
    }
  }

  //Resend OTP
  Future<OneTimePasswordAuthenticationModel> postResendOneTimePassword({
    required String email,
  }) async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/resend-otp';
      final response = await dio.post(
        url,
        data: {
          'email': email,
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
      if (e.response?.statusCode == 409) {
        return OneTimePasswordAuthenticationModel(
          code: 409,
          message: "User Not Found",
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
