import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:gasteei/icons/custom_icons.dart';

class BottomNavigationBarBlur extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavigationBarBlur({super.key, required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                ),
                child: SnakeNavigationBar.color(
                  onTap: onItemTapped,
                  currentIndex: currentIndex,
                  backgroundColor: Theme.of(context).cardColor.withOpacity(0.85),
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color(0xFF95B7C5),
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  elevation: 0,
                  snakeShape: SnakeShape.circle,
                  snakeViewColor: Theme.of(context).primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  items: const [
                    BottomNavigationBarItem(icon: Icon(CustomIcons.home, size: 24), label: "Home"),
                    BottomNavigationBarItem(icon: Icon(Icons.list_rounded, size: 34), label: "Expanses"),
                    BottomNavigationBarItem(icon: Icon(CustomIcons.barChart, size: 24), label: "BarChart"),
                    BottomNavigationBarItem(icon: Icon(CustomIcons.profile, size: 24), label: "Profile"),
                  ],
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
