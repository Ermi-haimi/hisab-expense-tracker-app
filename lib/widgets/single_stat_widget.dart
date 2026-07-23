import 'package:flutter/material.dart';
import '../constants.dart';
import '../providers/expenses_provider.dart';

class SingleStatWidget extends StatelessWidget {
  const SingleStatWidget({
    required this.provider,
    required this.statName,
    required this.value,
  });

  final ExpensesProvider provider;
  final String statName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(13),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              statName,
              style: kGreySmallTextStyle,
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight(600),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
