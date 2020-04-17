import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Settings {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Color menuColor;
  static const COLOR_PREF = 'COLOR_PREF';

  Future<Color> getColor() async {
    if (menuColor != null)
      return menuColor;
    else {
      final SharedPreferences prefs = await _prefs;
      int intColor = prefs.getInt(COLOR_PREF);
      print("Config:$intColor");
      menuColor = Color(intColor ?? Colors.red.value);
      return menuColor;
    }
  }

  void setColor(Color color) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(COLOR_PREF, (color ?? Colors.red).value);
  }

  static final Settings _settings = Settings._internal();

  factory Settings() {
    return _settings;
  }

  Settings._internal();
}
