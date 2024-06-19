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
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxMzcxMzQyfQ.PrSPbBCMO4ObpDF63xe23bWv12mewn5ZKvzrdOF9Qwo';
    return token;
  }

  //remove token
  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyToken);
  }
}
