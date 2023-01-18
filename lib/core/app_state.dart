import 'package:flutter/material.dart';
import 'package:gasteei/services/dark_theme_prefs.dart';

class AppState extends ChangeNotifier {
  bool _canSee = true;
  bool get canSee => _canSee;

  void switchView() {
    _canSee = !_canSee;
    notifyListeners();
  }

  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
