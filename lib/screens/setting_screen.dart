import 'package:flutter/material.dart';
import 'package:hisab/providers/setting_provider.dart';
import 'package:hisab/widgets/name_dialog.dart';
import 'package:provider/provider.dart';

import '../widgets/budget_dialog.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Text('Setting'),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monthly budget'),
                  Row(
                    children: [
                      Text(
                        settingProvider.monthlyBudget.toStringAsFixed(1),
                      ),
                      TextButton(
                        onPressed: () {
                          showBudgetDialog(context);
                        },
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name'),
                  Row(
                    children: [
                      Text(
                        settingProvider.userName,
                      ),
                      TextButton(
                        onPressed: () {
                          showNameDialog(context);
                        },
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
