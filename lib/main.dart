import 'package:flutter/material.dart';
import 'package:hisab/providers/expenses_provider.dart';
import 'package:hisab/providers/setting_provider.dart';
import 'package:hisab/screens/main_screen.dart';
import 'package:hisab/theme/apptheme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/expense.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  await Hive.openBox<Expense>('expenses');
  await Hive.openBox('setting');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpensesProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      themeMode: settingProvider.themeMode,

      home: MainScreen(),
    );
  }
}
