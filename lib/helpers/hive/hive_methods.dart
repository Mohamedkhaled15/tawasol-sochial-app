import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../theme/theme_enum.dart';

class HiveMethods {
  static final _box = Hive.box('app');

  static String getLang() {
    return _box.get('lang', defaultValue: 'ar');
  }

  static void updateLang(Locale locale) {
    _box.put('lang', locale.languageCode);
  }

  static String? getToken() {
    return _box.get('token');
  }

  static void updateToken(String token) {
    _box.put('token', 'Bearer $token');
  }

  static void deleteToken() {
    _box.delete('token');
  }

  static bool isFirstTime() {
    return _box.get('isFirstTime', defaultValue: true);
  }

  static void updateFirstTime() {
    _box.put('isFirstTime', false);
  }

  static ThemeEnum getTheme() {
    return _box.get(
      'theme',
      defaultValue: ThemeEnum.light,
    );
  }

  static void updateThem() {
    switch (getTheme()) {
      case ThemeEnum.light:
        _box.put(
          'theme',
          ThemeEnum.dark,
        );
        break;
      case ThemeEnum.dark:
        _box.put(
          'theme',
          ThemeEnum.light,
        );
        break;
    }
  }
}
