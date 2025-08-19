import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = 'en';

  void changeLanguage(String newLanguage) {
    if (language == newLanguage) {
      return;
    }
    language = newLanguage;
    notifyListeners();
  }
}
