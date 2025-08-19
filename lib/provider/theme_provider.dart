import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void changeTheme(ThemeMode newTheme) {
    if (themeMode == newTheme) {
      return;
    }
    themeMode = newTheme;
    notifyListeners();
  }
}
