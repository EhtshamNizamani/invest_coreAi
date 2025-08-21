import 'package:flutter/material.dart';
import 'package:invest_coreai/screens/account/account_screen.dart';
import 'package:invest_coreai/screens/portfolio/portfolio_screen.dart';
import 'package:invest_coreai/screens/trades_screens/top_traders_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Navigation state ab yahan manage hogi
  int _currentIndex = 0;

  // Screens ki list
  final List<Widget> _screens = [
    const PortfolioScreen(),
    const TopTradersScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body mein hum current index ke hisaab se screen dikhayenge
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Jab item par tap ho, to state update karein
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 5,
        selectedItemColor: const Color(0xFF4338CA), // Updated color from image
        unselectedItemColor: Colors.grey.shade400,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            activeIcon: Icon(Icons.circle),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline), // Correct icon for traders
            activeIcon: Icon(Icons.pie_chart),
            label: 'Traders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}