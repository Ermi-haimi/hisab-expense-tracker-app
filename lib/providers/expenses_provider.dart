import 'package:flutter/material.dart';
import 'package:hisab/models/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpensesProvider extends ChangeNotifier {
  final Box<Expense> _box = Hive.box<Expense>('expenses');

  List<Expense> get expenses => _box.values.toList();

  Future<void> addExpense(Expense expense) async {
    await _box.add(expense);
    notifyListeners();
  }

  Future<void> removeExpense(int index) async {
    await _box.deleteAt(index);
    notifyListeners();
  }
}
