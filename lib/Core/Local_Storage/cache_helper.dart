import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Here The Initialize of cache. (Added static)
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! this method to get string data specifically
  static String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key (Made static)
  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! this method to get data already saved in local database (Made static)
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! remove data using specific key (Made static)
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local database contains {key} (Removed Future/async & Made static)
  static bool containsKey({required String key}) {
    return sharedPreferences.containsKey(key);
  }

  //! Clear all data in the local database (Removed key parameter & Made static)
  static Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }
}