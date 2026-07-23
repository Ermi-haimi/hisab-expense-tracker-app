import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingProvider extends ChangeNotifier {
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

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    notifyListeners();
  }
}
