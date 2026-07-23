import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {
  SettingProvider() {
    loadTheme();
  }

  final Box settingBox = Hive.box('setting');
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  double get monthlyBudget =>
      settingBox.get('monthlyBudget', defaultValue: 0.0);

  void setMonthlyBudget(double budget) {
    settingBox.put('monthlyBudget', budget);
    notifyListeners();
  }

  String get userName => settingBox.get('userName', defaultValue: '');

  void setUserName(String name) {
    settingBox.put('userName', name);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      'isDarkMode',
      _themeMode == ThemeMode.dark,
    );
    notifyListeners();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool isDark = prefs.getBool('isDarkMode') ?? false;

    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}
