import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required data,
  }) async {
    if (data is int) return await sharedPreferences!.setInt(key, data);

    if (data is String) return await sharedPreferences!.setString(key, data);

    if (data is bool) return await sharedPreferences!.setBool(key, data);

    return await sharedPreferences!.setDouble(key, data);
  }

  static Future<bool> clearData(key) async {
    return await sharedPreferences!.remove(key);
  }
}
