import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hisab/providers/expenses_provider.dart';

import '../widgets/statistics_piechart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpensesProvider>();
    final categorySpending = provider.spendingByCategory;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(19),
              child: SizedBox(
                height: 300,
                child: CategoryPieChart(
                  categoryData: provider.spendingByCategory,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your total spent:'),
                Text(
                  provider.totalSpent.toString(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Average spending per expense:'),
                Text(
                  provider.averageExpense.toStringAsFixed(2),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('You spent the most money on:'),
                Text(
                  provider.highestCategory,
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This month you spent:'),
                Text(
                  provider.currentMonthSpent.toString(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today you spent:'),
                Text(
                  provider.todaySpent.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
