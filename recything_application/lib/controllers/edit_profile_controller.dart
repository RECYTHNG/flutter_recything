import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:recything_application/models/edit_profile_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var user = ProflieModel(
    name: '',
    email: '',
    phoneNumber: '',
    address: '',
    gender: '',
    birthDate: '',
  ).obs;

  final Dio _dio = Dio();

  Future<void> updateUserProfile(ProflieModel updatedUser) async {
    isLoading.value = true;
    final url = 'https://localhost:8080/v1/api/update-profile';

    try {
      final response = await _dio.put(
        url,
        data: updatedUser.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        user.value = updatedUser;
        Get.snackbar('Success', 'User updated!');
      } else {
        Get.snackbar('Error', 'Update failed: ${response.data}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Update failed: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
