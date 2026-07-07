import 'package:flutter/material.dart';
import 'package:hisab/providers/expenses_provider.dart';
import 'package:provider/provider.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteJokes = context.watch<ExpensesProvider>().expenses;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: favoriteJokes.length,
            itemBuilder: (context, index) {
              final item = favoriteJokes[index];
              return Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                                  color: Color(0xFF4F39F6),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                item.category,
                                style: TextStyle(fontWeight: FontWeight(300)),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
