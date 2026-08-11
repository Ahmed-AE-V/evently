import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale("en");
  Locale get locale => _locale;
  String get languageCode => _locale.languageCode;

  void setLanguage(String code) {
    if (_locale.languageCode == code) return;
    _locale = Locale(code);
    notifyListeners();
  }
}
