import 'package:flutter/material.dart';
import 'package:hisab/constants.dart';
import 'package:hisab/providers/expenses_provider.dart';
import 'package:provider/provider.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesList = context.watch<ExpensesProvider>().filteredExpenses;
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              context.read<ExpensesProvider>().setSearchQuery(value);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: expensesList.length,
            itemBuilder: (context, index) {
              final item = expensesList[index];
              return Card(
                // color: Colors.white,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight(700),
                                      color: categoryColors[item.category],
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    item.category,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    '${item.date.day} / ${item.date.month} / ${item.date.year}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              Text(
                                '\$${item.amount.toString()}',
                                style: Theme.of(context).textTheme.labelLarge,
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
                            context.read<ExpensesProvider>().removeExpense(
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
        ),
      ],
    );
  }
}
