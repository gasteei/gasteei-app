import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    const primaryColor = Color(0xFF0583F2);

    // Scaffold Colors Light
    const scaffolderBackgroundColorsLight = Color(0xFFF2F2F2);

    // Expansion Tile Colors Light
    const expansionTileCollapsedBgColorLight = Color(0xFF8DD5F2);
    const expasionTileTextColorLight = Colors.white;
    const expasionTileCollapsedTextColorLight = Colors.white;
    const expasionTileIconColorLight = Colors.white;
    const expasionTileCollapsedColorLight = Colors.white;
    const expasionTileBgColorLight = primaryColor;

    const dividerColorLight = Color(0xFFCDCDCD);

    // AppBarTheme Light
    const appBarThemeBgColorLight = Color(0xFFF2F2F2);

    // Scaffold Colors Dark
    const scaffolderBackgroundColorsDark = Color.fromARGB(255, 0, 0, 68);

    // AppBarTheme Dark
    const appBarThemeBgColorDark = Color(0xFF00001A);

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
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: expasionTileBgColorLight,
        collapsedBackgroundColor: expansionTileCollapsedBgColorLight,
        textColor: expasionTileTextColorLight,
        collapsedTextColor: expasionTileCollapsedTextColorLight,
        iconColor: expasionTileIconColorLight,
        collapsedIconColor: expasionTileCollapsedColorLight,
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColorLight,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? appBarThemeBgColorDark : appBarThemeBgColorLight,
      ),
      scaffoldBackgroundColor: isDarkTheme ? scaffolderBackgroundColorsDark : scaffolderBackgroundColorsLight,
      primaryColor: primaryColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            onPrimary: const Color(0xFF5EB9FC),
            secondary: isDarkTheme ? const Color(0xFF0583F2) : const Color(0xFFFF825A),
          ),
      cardColor: isDarkTheme ? const Color(0xFF0A0D2C) : const Color(0xFFFFFFFF),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
          ),
    );
  }
}
