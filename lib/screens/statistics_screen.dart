import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hisab/providers/expenses_provider.dart';

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
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Food'),
                      Text(
                        categorySpending['Food'] == null
                            ? '0'
                            : categorySpending['Food'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transport'),
                      Text(
                        categorySpending['Transport'] == null
                            ? '0'
                            : categorySpending['Transport'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Entertainment'),
                      Text(
                        categorySpending['Entertainment'] == null
                            ? '0'
                            : categorySpending['Entertainment'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bills'),
                      Text(
                        categorySpending['Bills'] == null
                            ? '0'
                            : categorySpending['Bills'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Health'),
                      Text(
                        categorySpending['Health'] == null
                            ? '0'
                            : categorySpending['Health'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shopping'),
                      Text(
                        categorySpending['Shopping'] == null
                            ? '0'
                            : categorySpending['Shopping'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Other'),
                      Text(
                        categorySpending['Other'] == null
                            ? '0'
                            : categorySpending['Other'].toString(),
                      ),
                    ],
                  ),
                ],
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
