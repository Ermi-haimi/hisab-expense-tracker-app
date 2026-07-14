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

    final recentExpenses = expenseProvider.recentExpenses;

    return SafeArea(
      child: SingleChildScrollView(
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
            SizedBox(
              height: 20,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Last 5 expenses',
                    style: kMediumBoldText,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recentExpenses.length,
                  itemBuilder: (context, index) {
                    final item = recentExpenses[index];
                    return Card(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 40,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight(700),
                                            color: Color(0xFF4F39F6),
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          item.category,
                                          style: TextStyle(
                                            fontWeight: FontWeight(300),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        Text(
                                          '${item.date.day} / ${item.date.month} / ${item.date.year}',
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\$${item.amount.toString()}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight(600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: -5,
                            child: PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'delete') {
                                  context
                                      .read<ExpensesProvider>()
                                      .removeExpense(
                                        index,
                                      );
                                }
                              },
                              color: Colors.white,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                        color: Color(0xFF4F39F6),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Color(0xFF4F39F6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
