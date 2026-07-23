import 'package:flutter/material.dart';
import 'package:hisab/providers/setting_provider.dart';
import 'package:hisab/widgets/name_dialog.dart';
import 'package:provider/provider.dart';
import 'package:hisab/constants.dart';

import '../main.dart';
import '../widgets/budget_dialog.dart';
import '../widgets/single_setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    ThemeMode theme = settingProvider.themeMode;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                    color: Color(0xFF4F39F6),
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
            SettingWidget(
              settingProvider: settingProvider,
              settingName: 'Monthly Budget',
              dialog: showBudgetDialog,
              value: settingProvider.monthlyBudget.toStringAsFixed(2),
            ),
            SettingWidget(
              settingProvider: settingProvider,
              settingName: 'Name',
              dialog: showNameDialog,
              value: settingProvider.userName,
            ),

            Switch(
              value: theme == ThemeMode.dark,
              thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                (Set<WidgetState> states) {
                  return theme == ThemeMode.dark
                      ? Icon(
                          Icons.dark_mode,
                          color: Colors.orange,
                        )
                      : Icon(Icons.light_mode);
                },
              ),

              onChanged: (value) {
                context.read<SettingProvider>().toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
