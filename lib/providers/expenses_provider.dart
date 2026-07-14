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

  //search function
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

  //Statistics

  int get totalExpenses => expenses.length;

  double get totalSpent {
    return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  //spending by categories
  Map<String, double> get spendingByCategory {
    final Map<String, double> data = {};

    for (final expense in expenses) {
      data.update(
        expense.category,
        (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    return data;
  }

  //highest amount category
  String get highestCategory {
    final map = spendingByCategory;

    if (map.isEmpty) return "";

    return map.entries
        .reduce(
          (a, b) => a.value > b.value ? a : b,
        )
        .key;
  }

  //average spending
  double get averageExpense {
    if (expenses.isEmpty) return 0;

    return totalSpent / expenses.length;
  }

  // current month spending
  double get currentMonthSpent {
    final now = DateTime.now();

    return expenses
        .where((e) => e.date.year == now.year && e.date.month == now.month)
        .fold(0, (sum, e) => sum + e.amount);
  }

  //today spending
  double get todaySpent {
    final now = DateTime.now();

    return expenses
        .where(
          (e) =>
              e.date.year == now.year &&
              e.date.month == now.month &&
              e.date.day == now.day,
        )
        .fold(0, (sum, e) => sum + e.amount);
  }

  List<Expense> get recentExpenses {
    final sortedExpenses = List<Expense>.from(expenses);

    sortedExpenses.sort((a, b) => b.date.compareTo(a.date));

    return sortedExpenses.take(5).toList();
  }
}
