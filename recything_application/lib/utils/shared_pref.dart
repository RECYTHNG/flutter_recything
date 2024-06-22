import 'package:shared_preferences/shared_preferences.dart';

String _keyToken = 'token';
String _keySearchHistory = 'searchHistory';

class SharedPref {
  //save token
  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyToken, token);
  }

  //get token
  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(_keyToken);
    return token;
  }

  //remove token
  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyToken);
  }

  // save search history
  static Future<void> saveHistory(List<String> listData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_keySearchHistory, listData);
  }

  // get search history
  static Future<List<String>> getSearchHistory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(_keySearchHistory) ?? [];
  }

  // add search history
  static Future<void> addHistory(String history) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> listData = preferences.getStringList(_keySearchHistory) ?? [];
    if (listData.length >= 5) {
      listData.removeLast();
    }
    listData.insert(0, history);
    await preferences.setStringList(_keySearchHistory, listData);
  }

  // delete search history
  static Future<void> deleteHistory(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> listData = preferences.getStringList(_keySearchHistory) ?? [];
    if (index >= 0 && index < listData.length) {
      listData.removeAt(index);
      await preferences.setStringList(_keySearchHistory, listData);
    }
  }

  // delete all search history
  static Future<void> deleteAllHistory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keySearchHistory);
  }
}