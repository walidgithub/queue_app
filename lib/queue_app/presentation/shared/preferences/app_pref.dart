import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  //lang
  Future<bool> setLang(String key, String lang) async {
    return await _sharedPreferences.setString(key, lang);
  }

  String? getLang(String key) {
    return _sharedPreferences.getString(key);
  }

  //Token
  Future<bool> setToken(String key, String token) async {
    return await _sharedPreferences.setString(key, token);
  }

  String? getToken(String key) {
    return _sharedPreferences.getString(key);
  }

}
