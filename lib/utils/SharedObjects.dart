import 'package:dog_breeds/config/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedObjects {
  static CachedSharedPreferences? prefs;
}

class CachedSharedPreferences {
  static CachedSharedPreferences? instance;
  static SharedPreferences? sharedPreferences;
  static final sessionKeyList = {Constants.accessToken};
  static Map<String, dynamic> map = {};

  static Future<CachedSharedPreferences> getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
    instance ??= CachedSharedPreferences();

    return instance!;
  }

  Future<bool> setString(String key, String value) async {
    bool result = await sharedPreferences!.setString(key, value);
    if (result) map[key] = value;

    return result;
  }

  Future<bool>? setInt(String key, int value) async {
    bool result = await sharedPreferences!.setInt(key, value);
    if (result) map[key] = value;

    return result;
  }

  Future<bool> setBool(String key, bool value) async {
    bool result = await sharedPreferences!.setBool(key, value);
    if (result) map[key] = value;

    return result;
  }

  Future<void> clearAll() async {
    await sharedPreferences!.clear();
    map = {};
  }

  Future<void> clearSession() async {
    await sharedPreferences!.remove(Constants.accessToken);
    map.removeWhere((k, v) => (sessionKeyList.contains(k)));
  }
}
