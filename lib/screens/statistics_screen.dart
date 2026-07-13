import 'package:flutter/material.dart';
import 'package:hisab/constants.dart';
import 'package:provider/provider.dart';
import 'package:hisab/providers/expenses_provider.dart';

import '../widgets/single_stat_widget.dart';
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
            SingleStatWidget(
              provider: provider,
              statName: 'Your total spent',
              value: provider.totalSpent.toString(),
            ),
            SingleStatWidget(
              provider: provider,
              statName: 'Your Average spending per expense',
              value: provider.averageExpense.toStringAsFixed(2),
            ),
            SingleStatWidget(
              provider: provider,
              statName: 'You spent the most money on',
              value: provider.highestCategory,
            ),
            SingleStatWidget(
              provider: provider,
              statName: 'This month you spent',
              value: provider.currentMonthSpent.toString(),
            ),
            SingleStatWidget(
              provider: provider,
              statName: 'Today you spent',
              value: provider.todaySpent.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
