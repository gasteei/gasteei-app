import 'package:flutter/material.dart';
import 'package:gasteei/screens/expenses_screen.dart';
import 'package:gasteei/screens/home/home_screen.dart';
import 'package:gasteei/screens/profile_screen.dart';
import 'package:gasteei/widgets/bottom_bar.dart';

class SettingViewScreen extends StatefulWidget {
  const SettingViewScreen({super.key});

  @override
  State<SettingViewScreen> createState() => _SettingViewScreenState();
}

class _SettingViewScreenState extends State<SettingViewScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigatioTapped(int page) {
    pageController.jumpToPage(page);
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[HomeScreen(), ExpensesScreen(), Text("BarChartScreen"), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _widgetOptions,
      ),
      //body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBarBlur(
        currentIndex: _page,
        onItemTapped: navigatioTapped,
      ),
    );
  }
}
