import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/setting_provider.dart';

void showBudgetDialog(BuildContext context) {
  final settingProvider = context.read<SettingProvider>();

  final controller = TextEditingController(
    text: settingProvider.monthlyBudget == 0
        ? ''
        : settingProvider.monthlyBudget.toString(),
  );

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Monthly Budget'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusColor: Color(0xFF4F39F6),
            labelText: 'Budget',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final budget = double.tryParse(controller.text);

              if (budget == null || budget < 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Please enter a valid budget',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                    backgroundColor: Color(0xFF4F39F6),
                  ),
                );
                return;
              }

              settingProvider.setMonthlyBudget(budget);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}
