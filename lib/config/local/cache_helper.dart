import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return await _sharedPreferences.setString(key, value);
  }

  static String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> removeAllData() async {
    return await _sharedPreferences.clear();
  }
}
