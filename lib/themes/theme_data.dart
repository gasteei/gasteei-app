import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 40,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline2: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5EB9FC),
          ),
          headline3: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          headline4: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: Theme.of(context).primaryColor,
        collapsedBackgroundColor: const Color(0xFF8DD5F2),
        textColor: Colors.white,
        collapsedTextColor: Colors.white,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFCDCDCD),
      ),
      appBarTheme: AppBarTheme(backgroundColor: isDarkTheme ? const Color(0xFF00001A) : const Color(0xFFF2F2F2)),
      scaffoldBackgroundColor: isDarkTheme ? const Color(0xFF00001A) : const Color(0xFFF2F2F2),
      primaryColor: const Color(0xFF0583F2),
      colorScheme: ThemeData().colorScheme.copyWith(
            onPrimary: const Color(0xFF5EB9FC),
            secondary: isDarkTheme ? const Color(0xFF0583F2) : const Color(0xFFFF825A),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme ? const Color(0xFF0A0D2C) : const Color(0xFFFFFFFF),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
          ),
    );
  }
}
