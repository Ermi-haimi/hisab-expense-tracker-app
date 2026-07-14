import 'package:flutter/material.dart';
import 'package:hisab/constants.dart';
import 'package:hisab/screens/new_expense_screen.dart';
import 'package:provider/provider.dart';

import '../providers/expenses_provider.dart';
import '../providers/setting_provider.dart';
import '../widgets/statistics_piechart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  int daysLeftInMonth() {
    final now = DateTime.now();
    final firstDayNextMonth = DateTime(now.year, now.month + 1, 1);

    return firstDayNextMonth.difference(now).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = context.watch<ExpensesProvider>();
    final settingProvider = context.watch<SettingProvider>();
    final double budget = settingProvider.monthlyBudget;
    final double currentMonthSpending = expenseProvider.currentMonthSpent;

    int daysLeft = daysLeftInMonth();

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${settingProvider.userName}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                      Text(
                        'Track your expenses wisely',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewExpenseScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff4f39f6),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff4F39F6),
                    Color(0xff7d05da),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total spent this month',
                            style: kSmallTextStyle,
                          ),
                          Text(
                            '\$$currentMonthSpending',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight(700),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          '\$',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Budget: \$$budget.',
                        style: kSmallTextStyle,
                      ),
                      Text(
                        'Remaining: \$${budget - currentMonthSpending}',
                        style: kSmallTextStyle,
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: (currentMonthSpending / budget).clamp(0.0, 1.0),
                    borderRadius: BorderRadius.circular(20),
                    minHeight: 10,
                    color: currentMonthSpending / budget <= 0.5
                        ? Colors.green[900]
                        : Colors.red[900],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${((budget > 0 ? currentMonthSpending / budget : 1) * 100).toStringAsFixed(0)}% Used.',
                        style: kSmallTextStyle,
                      ),
                      Text(
                        '$daysLeft days left',
                        style: kSmallTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: CategoryPieChart(
                categoryData: expenseProvider.spendingByCategory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
