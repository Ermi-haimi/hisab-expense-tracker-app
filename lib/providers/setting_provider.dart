import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingProvider extends ChangeNotifier {
  final Box settingBox = Hive.box('setting');

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
}
