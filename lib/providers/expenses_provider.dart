import 'package:flutter/material.dart';
import 'package:hisab/models/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpensesProvider extends ChangeNotifier {
  String _searchQuery = '';

  final Box<Expense> _box = Hive.box<Expense>('expenses');

  List<Expense> get expenses => _box.values.toList();

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Expense> get filteredExpenses {
    return expenses.where((expense) {
      return expense.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          expense.category.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (expense.note?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
              false);
    }).toList();
  }

  Future<void> addExpense(Expense expense) async {
    await _box.add(expense);
    notifyListeners();
  }

  Future<void> removeExpense(int index) async {
    await _box.deleteAt(index);
    notifyListeners();
  }
}
