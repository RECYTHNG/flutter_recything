import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:recything_application/models/user_profile_model.dart';

class UserProfileController extends GetxController {
  final Dio _dio = Dio();

  final userProfile = UserProfile(
    id: '',
    name: '',
    email: '',
    phoneNumber: '',
    point: 0,
    badge: '',
    gender: '',
    birthDate: DateTime(0001, 01, 01),
    address: '',
    pictureUrl: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _setupDioInterceptor();
    fetchUserProfile();
  }

  void _setupDioInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = 'http://192.168.246.217:8080/v1/api/';
        options.headers['Authorization'] =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE3NjkzNDQxfQ.mDAX2UzgRkSx8qagMqXJyaMpbEglJnUw1HqCJCaAPXI';
        return handler.next(options);
      },
    ));
  }

  Future<void> fetchUserProfile() async {
    try {
      final response = await _dio.get('/user/profile');
      if (response.statusCode == 200) {
        final userProfileData = UserProfile.fromJson(response.data['data']);
        userProfile(userProfileData);
        print('success');
      } else {
        // Handle error
        print('Failed to load user profile');
      }
    } catch (e) {
      // Handle Dio Error
      print('Error loading user profile: $e');
    }
  }
}
