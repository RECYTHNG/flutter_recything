import 'package:shared_preferences/shared_preferences.dart';

String _keyToken = 'token';

class SharedPref {
  //save token
  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyToken, token);
  }

  //get token
  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? token = preferences.getString(_keyToken);
    String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxMzkwNDc0fQ.Rl1TB5oB2gzMn-qW2KU7PxO2X-HzVWNnY4pHGB7F4e8';
    return token;
  }

  //remove token
  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyToken);
  }
}
