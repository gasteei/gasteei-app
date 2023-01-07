import 'package:flutter/material.dart';
import 'package:gasteei/screens/expanses_screen.dart';
import 'package:gasteei/screens/home_screen.dart';
import 'package:gasteei/screens/profile_screen.dart';
import 'package:gasteei/widgets/bottom_bar.dart';

class SettingViewScreen extends StatefulWidget {
  const SettingViewScreen({super.key});

  @override
  State<SettingViewScreen> createState() => _SettingViewScreenState();
}

class _SettingViewScreenState extends State<SettingViewScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[HomeScreen(), ExpansesScreen(), Text("BarChartScreen"), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBarBlur(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
