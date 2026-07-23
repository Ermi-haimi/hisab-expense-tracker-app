import 'package:flutter/material.dart';
import 'package:hisab/screens/home_screen.dart';
import 'package:hisab/screens/new_expense_screen.dart';
import 'package:hisab/screens/expenses_screen.dart';
import 'package:hisab/screens/setting_screen.dart';
import 'package:hisab/screens/statistics_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List _screens = [
    HomeScreen(),
    StatisticsScreen(),
    ExpensesScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF9FAFB),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        labelPadding: EdgeInsets.all(10),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorColor: Theme.of(context).navigationBarTheme.indicatorColor,
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
        height: 80,

        destinations: [
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              size: 40,
              Icons.home_filled,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              size: 45,
              Icons.home_filled,
              color: Color(0xFF4F39F6),
            ),
          ),
          NavigationDestination(
            label: 'Statistics',
            icon: Icon(
              size: 30,
              Icons.auto_graph_outlined,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              size: 35,
              Icons.auto_graph_outlined,
              color: Color(0xFF4F39F6),
            ),
          ),
          NavigationDestination(
            label: 'Search',
            icon: Icon(
              size: 30,
              Icons.search,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              size: 35,
              Icons.search,
              color: Color(0xFF4F39F6),
            ),
          ),
          NavigationDestination(
            label: 'Setting',
            icon: Icon(
              size: 30,
              Icons.settings,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              size: 35,
              Icons.settings,
              color: Color(0xFF4F39F6),
            ),
          ),
        ],
      ),
    );
  }
}
