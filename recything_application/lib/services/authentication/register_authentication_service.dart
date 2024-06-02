import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/models/authentication/register_authentication_model.dart';

class RegisterAuthenticationService {
  final Dio dio = Dio();

  Future<RegisterAuthenticationModel> postRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/register';
      final response = await dio.post(
        url,
        data: {
          'name': name,
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
        return RegisterAuthenticationModel(
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
        return RegisterAuthenticationModel(
          code: response.statusCode,
          message: response.data['message'],
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        if (kDebugMode) {
          print(e.response?.statusCode);
        }
        if (kDebugMode) {
          print(e.response?.data['message']);
        }
        return RegisterAuthenticationModel(
          code: 409,
          message: "Email already exists",
        );
      } else if (e.response?.statusCode == 400) {
        if (kDebugMode) {
          print(e.response?.statusCode);
        }
        if (kDebugMode) {
          print(e.response?.data['message']);
        }
        return RegisterAuthenticationModel(
          code: 400,
          message: "Invalid email format",
        );
      } else {
        if (kDebugMode) {
          print(e.response?.statusCode);
        }
        if (kDebugMode) {
          print(e.response?.data['message']);
        }
        return RegisterAuthenticationModel(
          code: e.response?.statusCode ?? 500,
          message: 'Internal Server Error',
        );
      }
    }
  }
}
