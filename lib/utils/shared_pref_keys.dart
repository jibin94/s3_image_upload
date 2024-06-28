import 'package:shared_preferences/shared_preferences.dart';

//Configuration class for shared Preference
class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;
  SharedPreferencesService._internal();

  static Future<SharedPreferencesService?> get instance async {
    _instance ??= SharedPreferencesService._internal();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  Future<void> setStringSession(String key, String value) async =>
      await _preferences!.setString(key, value);

  String? getStringSession(String key) => _preferences!.getString(key);

  Future<void> setBoolSession(String key, [bool value = false]) async =>
      await _preferences!.setBool(key, value);

  bool? getBoolSession(String key) => _preferences!.getBool(key);

  Future<void> setIntSession(String key, int value) async =>
      await _preferences!.setInt(key, value);

  int? getIntSession(String key) => _preferences!.getInt(key);

  Future<void> setDoubleSession(String key, double value) async =>
      await _preferences!.setDouble(key, value);

  double? getDoubleSession(String key) => _preferences!.getDouble(key);

  Future<void> clearSession() async => await _preferences!.clear();
}

//constants used to store in shared preference
class SharedPrefStrings {
  static const String isLoggedIn = "is_logged_in";
  static const String accessToken = "access_token";
  static const String userId = "user_id";
  static const String rememberMe = "remember_me";
  static const String password = "member_no";
  static const String userEmail = "user_email";
}
