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
              padding: EdgeInsets.all(15),
              // width: 170,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Setting',
                    style: TextStyle(
                      fontWeight: FontWeight(600),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monthly budget',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
            Card(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          ],
        ),
      ),
    );
  }
}
