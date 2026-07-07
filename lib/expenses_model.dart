class Expense {
  final String name;
  final String category;
  final double amount;
  final DateTime date;
  final String? note;

  Expense({
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
    this.note,
  });
}
