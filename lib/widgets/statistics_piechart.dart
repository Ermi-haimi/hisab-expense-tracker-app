import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hisab/constants.dart';

class CategoryPieChart extends StatelessWidget {
  final Map<String, double> categoryData;

  CategoryPieChart({
    super.key,
    required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 50,
        sections: _buildSections(),
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    int index = 0;

    return categoryData.entries.map((entry) {
      final total = categoryData.values.fold(0.0, (sum, item) => sum + item);

      final section = PieChartSectionData(
        color: categoryColors[entry.key],
        value: entry.value,
        title: "${((entry.value / total) * 100).toStringAsFixed(0)}% ",
        radius: 90,
        titleStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );

      index++;

      return section;
    }).toList();
  }
}
