import 'package:flutter/material.dart';
import 'package:hisab/constants.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = categoryColors.values.toList();
    final expenses = categoryColors.keys.toList();
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 8,
      childAspectRatio: 6,
      children: List.generate(
        categoryColors.length,
        (index) {
          final color = colors[index];
          final expense = expenses[index];

          return Text(
            expense,
            style: TextStyle(
              fontWeight: FontWeight(900),
              fontSize: 17,
              color: color,
            ),
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
